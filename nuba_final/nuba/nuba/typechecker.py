# nuba/typechecker.py - Simple static type checker / linter for Nuba

from .ast_nodes import *
from .errors import NubaError


class TypeWarning:
    def __init__(self, msg, line=0):
        self.msg  = msg
        self.line = line

    def __str__(self):
        return f"Warning (line {self.line}): {self.msg}"


class Scope:
    def __init__(self, parent=None):
        self.parent  = parent
        self.defined = set()
        self.used    = set()

    def define(self, name):
        self.defined.add(name)

    def lookup(self, name):
        if name in self.defined: return True
        if self.parent:          return self.parent.lookup(name)
        return False

    def child(self):
        return Scope(parent=self)


BUILTINS = {
    "print", "len", "type", "int", "float", "str", "bool", "input",
    "range", "list", "abs", "max", "min", "sum", "sorted", "reversed",
    "map", "filter", "reduce", "zip", "enumerate", "keys", "values",
    "items", "has", "push", "pop", "insert", "remove", "join", "split",
    "trim", "upper", "lower", "replace", "startswith", "endswith",
    "contains", "indexOf", "substr", "char", "ord", "format", "sqrt",
    "floor", "ceil", "round", "pow", "log", "sin", "cos", "tan",
    "random", "randint", "choice", "shuffle", "time", "sleep", "exit",
    "assert", "readFile", "writeFile", "jsonParse", "jsonStringify",
    "envGet", "isNull", "isInt", "isFloat", "isString", "isList",
    "isDict", "isBool", "PI", "E", "INF",
}


class TypeChecker:
    """
    A lightweight static checker that reports:
    - Use of undefined variables
    - Unreachable code after return
    - Functions called with wrong arity (where checkable)
    - Const reassignment
    """

    def __init__(self, filename="<stdin>"):
        self.filename = filename
        self.warnings: list[TypeWarning] = []
        self._funs   = {}      # name -> param count
        self._consts = set()

    def warn(self, msg, line=0):
        self.warnings.append(TypeWarning(msg, line))

    def check(self, program: Program):
        scope = Scope()
        for name in BUILTINS:
            scope.define(name)
        self._check_block(program.body, scope)
        return self.warnings

    def _check_block(self, stmts, scope):
        returned = False
        for stmt in stmts:
            if returned:
                self.warn("Unreachable code after return", getattr(stmt, 'line', 0))
                break
            returned = self._check_stmt(stmt, scope)

    def _check_stmt(self, node, scope):
        t = type(node)

        if t == VarDecl:
            if node.value:
                self._check_expr(node.value, scope)
            scope.define(node.name)
            if node.constant:
                self._consts.add(node.name)
            return False

        if t == AssignStmt:
            if isinstance(node.target, Identifier):
                if node.target.name in self._consts:
                    self.warn(f"Cannot reassign const '{node.target.name}'", node.line)
                if not scope.lookup(node.target.name):
                    self.warn(f"Assigning to undefined variable '{node.target.name}'", node.line)
            self._check_expr(node.value, scope)
            return False

        if t == FunDecl:
            self._funs[node.name] = len(node.params)
            scope.define(node.name)
            fn_scope = scope.child()
            for p in node.params:
                fn_scope.define(p)
            self._check_block(node.body, fn_scope)
            return False

        if t == ReturnStmt:
            if node.value:
                self._check_expr(node.value, scope)
            return True

        if t == IfStmt:
            self._check_expr(node.condition, scope)
            self._check_block(node.then_body, scope.child())
            for cond, body in node.elif_clauses:
                self._check_expr(cond, scope)
                self._check_block(body, scope.child())
            if node.else_body:
                self._check_block(node.else_body, scope.child())
            return False

        if t == WhileStmt:
            self._check_expr(node.condition, scope)
            self._check_block(node.body, scope.child())
            return False

        if t == ForStmt:
            self._check_expr(node.iterable, scope)
            child = scope.child()
            child.define(node.var)
            self._check_block(node.body, child)
            return False

        if t == ClassDecl:
            scope.define(node.name)
            cls_scope = scope.child()
            cls_scope.define("self")
            if node.superclass:
                cls_scope.define("super")
            for m in node.methods:
                self._check_stmt(m, cls_scope)
            return False

        if t == TryStmt:
            self._check_block(node.body, scope.child())
            if node.catch_body:
                ch = scope.child()
                if node.catch_var:
                    ch.define(node.catch_var)
                self._check_block(node.catch_body, ch)
            if node.finally_body:
                self._check_block(node.finally_body, scope.child())
            return False

        if t == ThrowStmt:
            self._check_expr(node.value, scope)
            return True

        if t == ExprStmt:
            self._check_expr(node.expr, scope)
            return False

        if t == PrintStmt:
            for v in node.values:
                self._check_expr(v, scope)
            return False

        if t in (BreakStmt, ContinueStmt, ImportStmt):
            return False

        if t == MatchStmt:
            self._check_expr(node.subject, scope)
            for pattern, body in node.cases:
                if pattern:
                    self._check_expr(pattern, scope)
                self._check_block(body, scope.child())
            return False

        return False

    def _check_expr(self, node, scope):
        t = type(node)

        if t == Identifier:
            if not scope.lookup(node.name):
                self.warn(f"Use of undefined variable '{node.name}'", node.line)

        elif t == BinOp:
            self._check_expr(node.left, scope)
            self._check_expr(node.right, scope)

        elif t == UnaryOp:
            self._check_expr(node.operand, scope)

        elif t == CallExpr:
            self._check_expr(node.callee, scope)
            for a in node.args:
                self._check_expr(a, scope)
            # arity check for known functions
            if isinstance(node.callee, Identifier):
                name = node.callee.name
                if name in self._funs:
                    expected = self._funs[name]
                    given    = len(node.args)
                    if given > expected:
                        self.warn(
                            f"'{name}' expects {expected} args, got {given}",
                            node.line
                        )

        elif t == MemberExpr:
            self._check_expr(node.obj, scope)

        elif t == IndexExpr:
            self._check_expr(node.obj, scope)
            self._check_expr(node.index, scope)

        elif t == ListLiteral:
            for e in node.elements:
                self._check_expr(e, scope)

        elif t == DictLiteral:
            for k, v in node.pairs:
                self._check_expr(k, scope)
                self._check_expr(v, scope)

        elif t == LambdaExpr:
            child = scope.child()
            for p in node.params:
                child.define(p)
            self._check_expr(node.body, child)

        elif t == NewExpr:
            if not scope.lookup(node.class_name):
                self.warn(f"Undefined class '{node.class_name}'", node.line)
            for a in node.args:
                self._check_expr(a, scope)

        elif t == TernaryExpr:
            self._check_expr(node.condition, scope)
            self._check_expr(node.then_val, scope)
            self._check_expr(node.else_val, scope)

        elif t == RangeExpr:
            self._check_expr(node.start, scope)
            self._check_expr(node.end, scope)
            if node.step:
                self._check_expr(node.step, scope)


def typecheck(program, filename="<stdin>") -> list:
    return TypeChecker(filename).check(program)
