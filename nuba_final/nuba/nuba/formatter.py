# nuba/formatter.py - Source code formatter for Nuba AST

from .ast_nodes import *
from .values import nuba_to_string


class Formatter:
    """Pretty-prints a Nuba AST back to source code."""

    def __init__(self, indent_size=4):
        self._indent = 0
        self._size   = indent_size

    def _pad(self):
        return " " * (self._indent * self._size)

    def _indent_block(self, stmts):
        self._indent += 1
        lines = [self.fmt_stmt(s) for s in stmts]
        self._indent -= 1
        return "\n".join(lines)

    def fmt(self, node):
        if isinstance(node, Program):
            return "\n".join(self.fmt_stmt(s) for s in node.body)
        return self.fmt_stmt(node)

    def fmt_stmt(self, node):
        pad = self._pad()
        t   = type(node)

        if t == VarDecl:
            kw  = "const" if node.constant else "let"
            val = " = " + self.fmt_expr(node.value) if node.value else ""
            return f"{pad}{kw} {node.name}{val}"

        if t == AssignStmt:
            return f"{pad}{self.fmt_expr(node.target)} {node.op} {self.fmt_expr(node.value)}"

        if t == ExprStmt:
            return f"{pad}{self.fmt_expr(node.expr)}"

        if t == PrintStmt:
            args = ", ".join(self.fmt_expr(v) for v in node.values)
            return f"{pad}print({args})"

        if t == FunDecl:
            params = self._fmt_params(node.params, node.defaults)
            body   = self._indent_block(node.body)
            return f"{pad}fun {node.name}({params}) {{\n{body}\n{pad}}}"

        if t == ReturnStmt:
            val = " " + self.fmt_expr(node.value) if node.value else ""
            return f"{pad}return{val}"

        if t == IfStmt:
            s = f"{pad}if {self.fmt_expr(node.condition)} {{\n"
            s += self._indent_block(node.then_body) + f"\n{pad}}}"
            for cond, body in node.elif_clauses:
                s += f" elif {self.fmt_expr(cond)} {{\n"
                s += self._indent_block(body) + f"\n{pad}}}"
            if node.else_body is not None:
                s += f" else {{\n" + self._indent_block(node.else_body) + f"\n{pad}}}"
            return s

        if t == WhileStmt:
            body = self._indent_block(node.body)
            return f"{pad}while {self.fmt_expr(node.condition)} {{\n{body}\n{pad}}}"

        if t == ForStmt:
            body = self._indent_block(node.body)
            return f"{pad}for {node.var} in {self.fmt_expr(node.iterable)} {{\n{body}\n{pad}}}"

        if t == BreakStmt:    return f"{pad}break"
        if t == ContinueStmt: return f"{pad}continue"

        if t == ClassDecl:
            sup  = f"({node.superclass})" if node.superclass else ""
            body = self._indent_block(node.methods)
            return f"{pad}class {node.name}{sup} {{\n{body}\n{pad}}}"

        if t == ReturnStmt:
            val = " " + self.fmt_expr(node.value) if node.value else ""
            return f"{pad}return{val}"

        if t == TryStmt:
            s  = f"{pad}try {{\n" + self._indent_block(node.body) + f"\n{pad}}}"
            if node.catch_body:
                var = f"({node.catch_var})" if node.catch_var else ""
                s += f" catch{var} {{\n" + self._indent_block(node.catch_body) + f"\n{pad}}}"
            if node.finally_body:
                s += f" finally {{\n" + self._indent_block(node.finally_body) + f"\n{pad}}}"
            return s

        if t == ThrowStmt:
            return f"{pad}throw {self.fmt_expr(node.value)}"

        if t == ImportStmt:
            if node.names:
                return f"{pad}from {node.module} import {', '.join(node.names)}"
            alias = f" as {node.alias}" if node.alias else ""
            return f"{pad}import {node.module}{alias}"

        return f"{pad}# <unknown stmt {t.__name__}>"

    def fmt_expr(self, node):
        t = type(node)
        if t == Literal:
            if node.value is None:  return "null"
            if node.value is True:  return "true"
            if node.value is False: return "false"
            if isinstance(node.value, str): return f'"{node.value}"'
            return str(node.value)
        if t == Identifier:   return node.name
        if t == SelfExpr:     return "self"
        if t == BinOp:
            return f"({self.fmt_expr(node.left)} {node.op} {self.fmt_expr(node.right)})"
        if t == UnaryOp:
            return f"{node.op} {self.fmt_expr(node.operand)}"
        if t == CallExpr:
            args   = ", ".join(self.fmt_expr(a) for a in node.args)
            kwargs = ", ".join(f"{k}={self.fmt_expr(v)}" for k, v in node.kwargs.items())
            all_args = ", ".join(filter(None, [args, kwargs]))
            return f"{self.fmt_expr(node.callee)}({all_args})"
        if t == MemberExpr:
            return f"{self.fmt_expr(node.obj)}.{node.attr}"
        if t == IndexExpr:
            return f"{self.fmt_expr(node.obj)}[{self.fmt_expr(node.index)}]"
        if t == ListLiteral:
            elems = ", ".join(self.fmt_expr(e) for e in node.elements)
            return f"[{elems}]"
        if t == DictLiteral:
            pairs = ", ".join(f"{self.fmt_expr(k)}: {self.fmt_expr(v)}" for k, v in node.pairs)
            return "{" + pairs + "}"
        if t == LambdaExpr:
            params = ", ".join(node.params)
            return f"fun({params}) -> {self.fmt_expr(node.body)}"
        if t == RangeExpr:
            s = f"{self.fmt_expr(node.start)}..{self.fmt_expr(node.end)}"
            if node.step: s += f":{self.fmt_expr(node.step)}"
            return s
        if t == NewExpr:
            args = ", ".join(self.fmt_expr(a) for a in node.args)
            return f"new {node.class_name}({args})"
        if t == TernaryExpr:
            return (f"{self.fmt_expr(node.then_val)} if {self.fmt_expr(node.condition)}"
                    f" else {self.fmt_expr(node.else_val)}")
        return f"<expr:{t.__name__}>"

    def _fmt_params(self, params, defaults):
        parts = []
        for p, d in zip(params, defaults):
            if d is not None:
                parts.append(f"{p} = {self.fmt_expr(d)}")
            else:
                parts.append(p)
        return ", ".join(parts)


def format_source(ast) -> str:
    return Formatter().fmt(ast)
