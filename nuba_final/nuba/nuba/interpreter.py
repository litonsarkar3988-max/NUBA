# nuba/interpreter.py - Tree-walk interpreter for the Nuba language

from .ast_nodes import *
from .environment import Environment
from .errors import (NubaRuntimeError, NubaTypeError, NubaIndexError,
                     NubaAttributeError, NubaZeroDivisionError,
                     ReturnSignal, BreakSignal, ContinueSignal, ThrowSignal)
from .values import (NubaFunction, NubaLambda, NubaClass, NubaInstance,
                     BoundMethod, NubaRange, NubaModule, nuba_to_string)
from .builtins import BUILTINS


class Interpreter:
    def __init__(self, filename="<stdin>"):
        self.filename = filename
        self.globals = Environment(name="<global>")
        self._load_builtins()
        self._module_cache = {}

    def _load_builtins(self):
        for name, val in BUILTINS.items():
            self.globals.define(name, val)

    # ── Public API ────────────────────────────────────────────────────────────

    def run(self, program: Program):
        self.exec_block(program.body, self.globals)

    def exec_block(self, stmts, env):
        for stmt in stmts:
            self.exec_stmt(stmt, env)

    # ── Statements ────────────────────────────────────────────────────────────

    def exec_stmt(self, node, env):
        t = type(node)

        if t == VarDecl:
            val = self.eval_expr(node.value, env) if node.value else None
            env.define(node.name, val, node.constant)

        elif t == AssignStmt:
            val = self.eval_expr(node.value, env)
            self._do_assign(node.target, val, node.op, env)

        elif t == ExprStmt:
            self.eval_expr(node.expr, env)

        elif t == PrintStmt:
            parts = [nuba_to_string(self.eval_expr(v, env)) for v in node.values]
            print(*parts)

        elif t == FunDecl:
            fn = NubaFunction(node.name, node.params, node.defaults, node.body, env, self)
            env.define(node.name, fn)

        elif t == ReturnStmt:
            val = self.eval_expr(node.value, env) if node.value else None
            raise ReturnSignal(val)

        elif t == IfStmt:
            if self._truthy(self.eval_expr(node.condition, env)):
                child = env.child("<if>")
                self.exec_block(node.then_body, child)
            else:
                for cond, body in node.elif_clauses:
                    if self._truthy(self.eval_expr(cond, env)):
                        self.exec_block(body, env.child("<elif>"))
                        return
                if node.else_body is not None:
                    self.exec_block(node.else_body, env.child("<else>"))

        elif t == WhileStmt:
            while self._truthy(self.eval_expr(node.condition, env)):
                try:
                    self.exec_block(node.body, env.child("<while>"))
                except BreakSignal:
                    break
                except ContinueSignal:
                    continue

        elif t == ForStmt:
            iterable = self.eval_expr(node.iterable, env)
            iterable = self._iter(iterable)
            for item in iterable:
                child = env.child("<for>")
                child.define(node.var, item)
                try:
                    self.exec_block(node.body, child)
                except BreakSignal:
                    break
                except ContinueSignal:
                    continue

        elif t == BreakStmt:
            raise BreakSignal()

        elif t == ContinueStmt:
            raise ContinueSignal()

        elif t == ClassDecl:
            superclass = None
            if node.superclass:
                superclass = env.get(node.superclass)
            methods = {}
            klass = NubaClass(node.name, superclass, {}, env, self)
            for m in node.methods:
                if isinstance(m, FunDecl):
                    fn = NubaFunction(m.name, m.params, m.defaults, m.body, env, self)
                    fn.defining_class = klass
                    klass.methods[m.name] = fn
            env.define(node.name, klass)

        elif t == ImportStmt:
            self._do_import(node, env)

        elif t == TryStmt:
            try:
                self.exec_block(node.body, env.child("<try>"))
            except ThrowSignal as e:
                if node.catch_body:
                    child = env.child("<catch>")
                    if node.catch_var:
                        child.define(node.catch_var, e.value)
                    self.exec_block(node.catch_body, child)
            except NubaRuntimeError as e:
                if node.catch_body:
                    child = env.child("<catch>")
                    if node.catch_var:
                        child.define(node.catch_var, str(e))
                    self.exec_block(node.catch_body, child)
            finally:
                if node.finally_body:
                    self.exec_block(node.finally_body, env.child("<finally>"))

        elif t == ThrowStmt:
            val = self.eval_expr(node.value, env)
            raise ThrowSignal(val)

        elif t == MatchStmt:
            subject = self.eval_expr(node.subject, env)
            for pattern, body in node.cases:
                if pattern is None or self._eq(self.eval_expr(pattern, env), subject):
                    child = env.child("<case>")
                    self.exec_block(body, child)
                    break

        else:
            raise NubaRuntimeError(f"Unknown statement: {t.__name__}")

    # ── Expressions ───────────────────────────────────────────────────────────

    def eval_expr(self, node, env):
        t = type(node)

        if t == Literal:
            return node.value

        if t == Identifier:
            return env.get(node.name)

        if t == SelfExpr:
            return env.get("self")

        if t == ListLiteral:
            return [self.eval_expr(e, env) for e in node.elements]

        if t == DictLiteral:
            return {self.eval_expr(k, env): self.eval_expr(v, env) for k, v in node.pairs}

        if t == RangeExpr:
            start = int(self.eval_expr(node.start, env))
            end   = int(self.eval_expr(node.end, env))
            step  = int(self.eval_expr(node.step, env)) if node.step else 1
            return NubaRange(start, end, step)

        if t == BinOp:
            return self._binop(node, env)

        if t == UnaryOp:
            val = self.eval_expr(node.operand, env)
            if node.op == '-':
                return -val
            if node.op == 'not':
                return not self._truthy(val)
            raise NubaRuntimeError(f"Unknown unary op {node.op}")

        if t == CallExpr:
            callee = self.eval_expr(node.callee, env)
            args   = [self.eval_expr(a, env) for a in node.args]
            kwargs = {k: self.eval_expr(v, env) for k, v in node.kwargs.items()}
            return self._call(callee, args, kwargs)

        if t == IndexExpr:
            obj = self.eval_expr(node.obj, env)
            idx = self.eval_expr(node.index, env)
            return self._index_get(obj, idx)

        if t == MemberExpr:
            obj = self.eval_expr(node.obj, env)
            return self._member_get(obj, node.attr)

        if t == LambdaExpr:
            # is_block=True হলে body একটি statement list (ব্লক লাম্বদা)
            # is_block=False হলে body একটি expression (এক্সপ্রেশন লাম্বদা)
            return NubaLambda(node.params, node.body, env, self,
                              is_block=node.is_block)

        if t == NewExpr:
            klass = env.get(node.class_name)
            if not isinstance(klass, NubaClass):
                raise NubaRuntimeError(f"'{node.class_name}' is not a class")
            args = [self.eval_expr(a, env) for a in node.args]
            return klass.instantiate(args)

        if t == SuperExpr:
            instance = env.get("self")
            # Use the defining class stored in env, not instance.klass
            # This ensures super works correctly in deep inheritance chains
            try:
                current_class = env.get("__class__")
                superclass = current_class.superclass if current_class else None
            except Exception:
                superclass = None
            if not superclass:
                superclass = instance.klass.superclass
            if not superclass:
                raise NubaRuntimeError("No superclass")
            method = superclass.find_method(node.method)
            if not method:
                raise NubaRuntimeError(f"Super has no method '{node.method}'")
            bm = BoundMethod(instance, method)
            args = [self.eval_expr(a, env) for a in node.args]
            return bm.call(args)

        if t == TernaryExpr:
            cond = self._truthy(self.eval_expr(node.condition, env))
            return self.eval_expr(node.then_val if cond else node.else_val, env)

        raise NubaRuntimeError(f"Unknown expression node: {t.__name__}")

    # ── Helpers ───────────────────────────────────────────────────────────────

    def _truthy(self, val):
        if val is None or val is False: return False
        if isinstance(val, (int, float)): return val != 0
        if isinstance(val, str): return val != ""
        if isinstance(val, list): return len(val) > 0
        if isinstance(val, dict): return len(val) > 0
        return True

    def _eq(self, a, b):
        return a == b

    def _call(self, callee, args, kwargs=None):
        kwargs = kwargs or {}
        if isinstance(callee, NubaClass):
            return callee.instantiate(args)
        if isinstance(callee, (NubaFunction, NubaLambda, BoundMethod)):
            return callee.call(args, kwargs)
        if hasattr(callee, 'call'):
            return callee.call(args, kwargs)
        if callable(callee):
            # Python builtin
            return callee(args, kwargs)
        raise NubaTypeError(f"'{nuba_to_string(callee)}' is not callable")

    def _index_get(self, obj, idx):
        if isinstance(obj, (list, str)):
            try: return obj[int(idx)]
            except IndexError: raise NubaIndexError(f"Index {idx} out of range")
        if isinstance(obj, dict):
            if idx not in obj:
                raise NubaRuntimeError(f"Key {idx!r} not found in dict")
            return obj[idx]
        if isinstance(obj, NubaRange):
            return list(obj)[int(idx)]
        raise NubaTypeError(f"Cannot index {type(obj).__name__}")

    def _member_get(self, obj, attr):
        if isinstance(obj, NubaInstance):
            return obj.get(attr)
        if isinstance(obj, NubaModule):
            return obj.get(attr)
        if isinstance(obj, dict):
            if attr in obj: return obj[attr]
            if attr == "copy":
                fn = lambda a, _: dict(obj)
            elif attr == "keys":
                fn = lambda a, _: list(obj.keys())
            elif attr == "values":
                fn = lambda a, _: list(obj.values())
            elif attr == "items":
                fn = lambda a, _: [[k,v] for k,v in obj.items()]
            elif attr == "has":
                fn = lambda a, _: len(a) > 0 and a[0] in obj
            else:
                raise NubaAttributeError(f"Dict has no attribute '{attr}'")
            class _DictMethod:
                def __init__(self, f): self._f = f
                def call(self, args, kwargs=None): return self._f(args, kwargs)
            return _DictMethod(fn)
        if isinstance(obj, list):
            return self._list_method(obj, attr)
        if isinstance(obj, str):
            return self._str_method(obj, attr)
        if isinstance(obj, NubaClass):
            return obj.methods.get(attr, None)
        raise NubaAttributeError(f"Cannot get attribute '{attr}' on {nuba_to_string(obj)!r}")

    def _list_method(self, lst, attr):
        methods = {
            "push":    lambda a, _: (lst.append(a[0]), lst)[1],
            "pop":     lambda a, _: lst.pop(int(a[0]) if a else -1),
            "length":  lambda a, _: len(lst),
            "contains":lambda a, _: a[0] in lst,
            "indexOf": lambda a, _: lst.index(a[0]) if a[0] in lst else -1,
            "slice":   lambda a, _: lst[int(a[0]):int(a[1]) if len(a)>1 else None],
            "join":    lambda a, _: (a[0] if a else "").join(nuba_to_string(x) for x in lst),
            "map":     lambda a, _: [a[0].call([x]) for x in lst],
            "filter":  lambda a, _: [x for x in lst if a[0].call([x])],
            "forEach": lambda a, _: [a[0].call([x]) for x in lst] and None,
            "reverse": lambda a, _: (lst.reverse(), lst)[1],
            "sort":    lambda a, _: (lst.sort(), lst)[1],
            "flat":    lambda a, _: [item for sub in lst for item in (sub if isinstance(sub, list) else [sub])],
            "copy":    lambda a, _: lst[:],
            "clear":   lambda a, _: (lst.clear(), lst)[1],
            "first":   lambda a, _: lst[0] if lst else None,
            "last":    lambda a, _: lst[-1] if lst else None,
        }
        if attr not in methods:
            raise NubaAttributeError(f"List has no method '{attr}'")
        fn = methods[attr]
        class _BuiltinMethod:
            def call(self_, args, kwargs=None): return fn(args, kwargs)
        return _BuiltinMethod()

    def _str_method(self, s, attr):
        methods = {
            "length":     lambda a, _: len(s),
            "upper":      lambda a, _: s.upper(),
            "lower":      lambda a, _: s.lower(),
            "trim":       lambda a, _: s.strip(),
            "split":      lambda a, _: s.split(a[0] if a else None),
            "contains":   lambda a, _: str(a[0]) in s,
            "startsWith": lambda a, _: s.startswith(str(a[0])),
            "endsWith":   lambda a, _: s.endswith(str(a[0])),
            "replace":    lambda a, _: s.replace(str(a[0]), str(a[1])),
            "indexOf":    lambda a, _: s.find(str(a[0])),
            "substr":     lambda a, _: s[int(a[0]):int(a[1]) if len(a)>1 else None],
            "chars":      lambda a, _: list(s),
            "repeat":     lambda a, _: s * int(a[0]),
        }
        if attr not in methods:
            raise NubaAttributeError(f"String has no method '{attr}'")
        fn = methods[attr]
        class _BuiltinMethod:
            def call(self_, args, kwargs=None): return fn(args, kwargs)
        return _BuiltinMethod()

    def _do_assign(self, target, val, op, env):
        if isinstance(target, Identifier):
            if op != '=':
                old = env.get(target.name)
                val = self._apply_op(old, op[0], val)
            env.set(target.name, val)
        elif isinstance(target, IndexExpr):
            obj = self.eval_expr(target.obj, env)
            idx = self.eval_expr(target.index, env)
            if op != '=':
                old = self._index_get(obj, idx)
                val = self._apply_op(old, op[0], val)
            obj[idx] = val
        elif isinstance(target, MemberExpr):
            obj = self.eval_expr(target.obj, env)
            if op != '=':
                old = self._member_get(obj, target.attr)
                val = self._apply_op(old, op[0], val)
            if isinstance(obj, NubaInstance):
                obj.set(target.attr, val)
            elif isinstance(obj, dict):
                obj[target.attr] = val
            else:
                raise NubaRuntimeError(f"Cannot assign attribute on {type(obj).__name__}")
        else:
            raise NubaRuntimeError("Invalid assignment target")

    def _apply_op(self, a, op, b):
        if op == '+': return a + b
        if op == '-': return a - b
        if op == '*': return a * b
        if op == '/': return self._div(a, b)
        raise NubaRuntimeError(f"Unknown op {op}")

    def _div(self, a, b):
        if b == 0:
            raise NubaZeroDivisionError("Division by zero")
        return a / b if isinstance(a, float) or isinstance(b, float) else a // b

    def _binop(self, node, env):
        op = node.op
        # Short circuit
        if op == 'and':
            l = self.eval_expr(node.left, env)
            return l if not self._truthy(l) else self.eval_expr(node.right, env)
        if op == 'or':
            l = self.eval_expr(node.left, env)
            return l if self._truthy(l) else self.eval_expr(node.right, env)

        left  = self.eval_expr(node.left, env)
        right = self.eval_expr(node.right, env)

        if op == '+':
            if isinstance(left, list) and isinstance(right, list):
                return left + right
            if isinstance(left, str) or isinstance(right, str):
                return nuba_to_string(left) + nuba_to_string(right)
            return left + right
        if op == '-':  return left - right
        if op == '*':
            if isinstance(left, str) and isinstance(right, int):
                return left * right
            return left * right
        if op == '/':  return self._div(left, right)
        if op == '%':  return left % right
        if op == '**': return left ** right
        if op == '==': return self._eq(left, right)
        if op == '!=': return not self._eq(left, right)
        if op == '<':  return left < right
        if op == '>':  return left > right
        if op == '<=': return left <= right
        if op == '>=': return left >= right
        if op == 'is': return left is right or self._eq(left, right)
        raise NubaRuntimeError(f"Unknown binary operator '{op}'")

    def _iter(self, obj):
        if isinstance(obj, (list, dict, str)):
            return obj
        if isinstance(obj, NubaRange):
            return obj
        raise NubaTypeError(f"'{nuba_to_string(obj)}' is not iterable")

    def _do_import(self, node, env):
        import importlib, sys, os
        module_name = node.module

        # Try stdlib modules
        stdlib_path = os.path.join(os.path.dirname(__file__), '..', 'stdlib')
        nu_file = os.path.join(stdlib_path, module_name.replace('.', os.sep) + '.nu')

        if os.path.exists(nu_file):
            from .runner import run_file_to_env
            mod_env = run_file_to_env(nu_file)
            mod = NubaModule(module_name, mod_env)
        else:
            # Try as Python module
            try:
                pymod = importlib.import_module(module_name)
                mod_env = Environment(name=module_name)
                for k, v in vars(pymod).items():
                    if not k.startswith('_'):
                        mod_env.define(k, v)
                mod = NubaModule(module_name, mod_env)
            except ImportError:
                from .errors import NubaImportError
                raise NubaImportError(f"Cannot import module '{module_name}'")

        alias = node.alias or module_name.split('.')[-1]

        if node.names:
            for name in node.names:
                env.define(name, mod.get(name))
        else:
            env.define(alias, mod)
