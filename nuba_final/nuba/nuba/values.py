# nuba/values.py - Runtime value types for Nuba

from .errors import NubaRuntimeError, NubaAttributeError


class NubaFunction:
    def __init__(self, name, params, defaults, body, closure, interpreter):
        self.name = name
        self.params = params
        self.defaults = defaults
        self.body = body
        self.closure = closure
        self.interpreter = interpreter
        self.defining_class = None  # set when added to a class

    def call(self, args, kwargs=None):
        from .environment import Environment
        from .errors import ReturnSignal
        kwargs = kwargs or {}
        env = self.closure.child(f"fun:{self.name}")

        # bind positional args
        for i, param in enumerate(self.params):
            if i < len(args):
                env.define(param, args[i])
            elif param in kwargs:
                env.define(param, kwargs[param])
            elif self.defaults[i] is not None:
                env.define(param, self.interpreter.eval_expr(self.defaults[i], self.closure))
            else:
                raise NubaRuntimeError(f"Missing argument '{param}' for function '{self.name}'")

        try:
            self.interpreter.exec_block(self.body, env)
        except ReturnSignal as r:
            return r.value
        return None

    def __repr__(self):
        return f"<fun {self.name}({', '.join(self.params)})>"


class NubaLambda:
    def __init__(self, params, body, closure, interpreter, is_block=False):
        self.params   = params
        self.body     = body
        self.closure  = closure
        self.interpreter = interpreter
        self.is_block = is_block   # True → body হলো statement list

    def call(self, args, kwargs=None):
        from .errors import ReturnSignal
        env = self.closure.child("<lambda>")
        for i, p in enumerate(self.params):
            env.define(p, args[i] if i < len(args) else None)

        if self.is_block:
            # ব্লক লাম্বদা: একাধিক statement, return দিয়ে মান ফেরানো যায়
            try:
                self.interpreter.exec_block(self.body, env)
            except ReturnSignal as r:
                return r.value
            return None
        else:
            # এক্সপ্রেশন লাম্বদা: সরাসরি মান মূল্যায়ন করে ফেরত দেয়
            return self.interpreter.eval_expr(self.body, env)

    def __repr__(self):
        kind = "block" if self.is_block else "expr"
        return f"<lambda[{kind}]({', '.join(self.params)})>"


class NubaClass:
    def __init__(self, name, superclass, methods, env, interpreter):
        self.name = name
        self.superclass = superclass
        self.methods = methods   # dict name -> NubaFunction
        self.env = env
        self.interpreter = interpreter

    def instantiate(self, args):
        instance = NubaInstance(self)
        init = self.find_method("init")
        if init:
            init_bound = BoundMethod(instance, init)
            init_bound.call(args)
        return instance

    def find_method(self, name):
        if name in self.methods:
            return self.methods[name]
        if self.superclass:
            return self.superclass.find_method(name)
        return None

    def __repr__(self):
        return f"<class {self.name}>"


class NubaInstance:
    def __init__(self, klass):
        self.klass = klass
        self.fields = {}

    def get(self, name):
        if name in self.fields:
            return self.fields[name]
        method = self.klass.find_method(name)
        if method:
            return BoundMethod(self, method)
        raise NubaAttributeError(f"'{self.klass.name}' has no attribute '{name}'")

    def set(self, name, value):
        self.fields[name] = value

    def __repr__(self):
        return f"<{self.klass.name} instance>"


class BoundMethod:
    def __init__(self, instance, func):
        self.instance = instance
        self.func = func
        self.defining_class = func.defining_class

    def call(self, args, kwargs=None):
        from .environment import Environment
        from .errors import ReturnSignal
        kwargs = kwargs or {}
        env = self.func.closure.child(f"method:{self.func.name}")
        env.define("self", self.instance)
        env.define("__class__", self.func.defining_class)

        for i, param in enumerate(self.func.params):
            if param == "self":
                continue
            pi = i - 1  # account for self
            if pi < len(args):
                env.define(param, args[pi])
            elif param in kwargs:
                env.define(param, kwargs[param])
            elif self.func.defaults[i] is not None:
                env.define(param, self.func.interpreter.eval_expr(self.func.defaults[i], self.func.closure))
            else:
                raise NubaRuntimeError(f"Missing argument '{param}'")
        try:
            self.func.interpreter.exec_block(self.func.body, env)
        except ReturnSignal as r:
            return r.value
        return None

    def __repr__(self):
        return f"<bound method {self.func.name}>"


class NubaRange:
    def __init__(self, start, end, step=1):
        self.start = start
        self.end = end
        self.step = step

    def __iter__(self):
        return iter(range(self.start, self.end, self.step))

    def to_list(self):
        return list(range(self.start, self.end, self.step))

    def __repr__(self):
        return f"<range {self.start}..{self.end}>"


def nuba_to_string(val):
    if val is None:           return "null"
    if isinstance(val, bool): return "true" if val else "false"
    if isinstance(val, list):
        inner = ", ".join(nuba_to_string(x) for x in val)
        return f"[{inner}]"
    if isinstance(val, dict):
        pairs = ", ".join(f"{nuba_to_string(k)}: {nuba_to_string(v)}" for k, v in val.items())
        return "{" + pairs + "}"
    return str(val)


class NubaModule:
    def __init__(self, name, env):
        self.name = name
        self.env = env

    def get(self, name):
        return self.env.get(name)

    def __repr__(self):
        return f"<module {self.name}>"
