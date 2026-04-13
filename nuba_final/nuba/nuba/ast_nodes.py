# nuba/ast_nodes.py - AST node definitions for Nuba

from dataclasses import dataclass, field
from typing import Any, List, Optional


# ── Base ──────────────────────────────────────────────────────────────────────

class Node:
    pass

# ── Statements ────────────────────────────────────────────────────────────────

@dataclass
class Program(Node):
    body: List[Node]

@dataclass
class VarDecl(Node):
    name: str
    value: Optional[Node]
    constant: bool = False
    line: int = 0

@dataclass
class FunDecl(Node):
    name: str
    params: List[str]
    defaults: List[Optional[Node]]
    body: List[Node]
    line: int = 0

@dataclass
class ReturnStmt(Node):
    value: Optional[Node]
    line: int = 0

@dataclass
class IfStmt(Node):
    condition: Node
    then_body: List[Node]
    elif_clauses: List  # list of (condition, body)
    else_body: Optional[List[Node]]
    line: int = 0

@dataclass
class WhileStmt(Node):
    condition: Node
    body: List[Node]
    line: int = 0

@dataclass
class ForStmt(Node):
    var: str
    iterable: Node
    body: List[Node]
    line: int = 0

@dataclass
class BreakStmt(Node):
    line: int = 0

@dataclass
class ContinueStmt(Node):
    line: int = 0

@dataclass
class ImportStmt(Node):
    module: str
    alias: Optional[str]
    names: List[str]   # for "from x import a, b"
    line: int = 0

@dataclass
class ClassDecl(Node):
    name: str
    superclass: Optional[str]
    methods: List[Node]
    line: int = 0

@dataclass
class TryStmt(Node):
    body: List[Node]
    catch_var: Optional[str]
    catch_body: List[Node]
    finally_body: Optional[List[Node]]
    line: int = 0

@dataclass
class ThrowStmt(Node):
    value: Node
    line: int = 0

@dataclass
class MatchStmt(Node):
    subject: Node
    cases: List  # list of (pattern, body)
    line: int = 0

@dataclass
class ExprStmt(Node):
    expr: Node
    line: int = 0

@dataclass
class PrintStmt(Node):
    values: List[Node]
    line: int = 0

@dataclass
class AssignStmt(Node):
    target: Node
    value: Node
    op: str = '='
    line: int = 0

# ── Expressions ───────────────────────────────────────────────────────────────

@dataclass
class BinOp(Node):
    left: Node
    op: str
    right: Node
    line: int = 0

@dataclass
class UnaryOp(Node):
    op: str
    operand: Node
    line: int = 0

@dataclass
class Literal(Node):
    value: Any
    line: int = 0

@dataclass
class Identifier(Node):
    name: str
    line: int = 0

@dataclass
class CallExpr(Node):
    callee: Node
    args: List[Node]
    kwargs: dict = field(default_factory=dict)
    line: int = 0

@dataclass
class IndexExpr(Node):
    obj: Node
    index: Node
    line: int = 0

@dataclass
class MemberExpr(Node):
    obj: Node
    attr: str
    line: int = 0

@dataclass
class ListLiteral(Node):
    elements: List[Node]
    line: int = 0

@dataclass
class DictLiteral(Node):
    pairs: List  # list of (key_node, value_node)
    line: int = 0

@dataclass
class LambdaExpr(Node):
    params: List[str]
    body: Any          # Node (expr) অথবা List[Node] (block)
    line: int = 0
    is_block: bool = False   # True হলে body একটি statement list

@dataclass
class RangeExpr(Node):
    start: Node
    end: Node
    step: Optional[Node] = None
    line: int = 0

@dataclass
class NewExpr(Node):
    class_name: str
    args: List[Node]
    line: int = 0

@dataclass
class SelfExpr(Node):
    line: int = 0

@dataclass
class SuperExpr(Node):
    method: str
    args: List[Node]
    line: int = 0

@dataclass
class TernaryExpr(Node):
    condition: Node
    then_val: Node
    else_val: Node
    line: int = 0

@dataclass
class InterpolatedString(Node):
    parts: List  # mix of str and Node
    line: int = 0
