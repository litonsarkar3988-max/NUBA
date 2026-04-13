# nuba/parser.py - Parser for the Nuba language

from .tokens import Token, TokenType
from .ast_nodes import *
from .errors import NubaParseError


class Parser:
    def __init__(self, tokens, filename="<stdin>"):
        self.tokens = [t for t in tokens if t.type not in (TokenType.NEWLINE, TokenType.COMMENT, TokenType.SEMICOLON)]
        self.pos = 0
        self.filename = filename

    def error(self, msg, token=None):
        t = token or self.current()
        raise NubaParseError(f"{self.filename}:{t.line}:{t.col}: {msg}")

    def current(self):
        return self.tokens[self.pos]

    def peek(self, offset=1):
        idx = self.pos + offset
        if idx < len(self.tokens):
            return self.tokens[idx]
        return self.tokens[-1]

    def advance(self):
        t = self.tokens[self.pos]
        if self.pos < len(self.tokens) - 1:
            self.pos += 1
        return t

    def check(self, *types):
        return self.current().type in types

    def match(self, *types):
        if self.current().type in types:
            return self.advance()
        return None

    def expect(self, type_, msg=None):
        if self.current().type == type_:
            return self.advance()
        self.error(msg or f"Expected {type_.name}, got {self.current().type.name!r} ({self.current().value!r})")

    # ── Top level ─────────────────────────────────────────────────────────────

    def parse(self):
        body = []
        while not self.check(TokenType.EOF):
            stmt = self.parse_statement()
            if stmt:
                body.append(stmt)
        return Program(body)

    # ── Statements ────────────────────────────────────────────────────────────

    def parse_statement(self):
        t = self.current()

        if t.type == TokenType.LET:
            return self.parse_var_decl(constant=False)
        if t.type == TokenType.CONST:
            return self.parse_var_decl(constant=True)
        if t.type == TokenType.FUN:
            return self.parse_fun_decl()
        if t.type == TokenType.RETURN:
            return self.parse_return()
        if t.type == TokenType.IF:
            return self.parse_if()
        if t.type == TokenType.WHILE:
            return self.parse_while()
        if t.type == TokenType.FOR:
            return self.parse_for()
        if t.type == TokenType.BREAK:
            self.advance()
            return BreakStmt(line=t.line)
        if t.type == TokenType.CONTINUE:
            self.advance()
            return ContinueStmt(line=t.line)
        if t.type == TokenType.IMPORT:
            return self.parse_import()
        if t.type == TokenType.FROM:
            return self.parse_from_import()
        if t.type == TokenType.CLASS:
            return self.parse_class()
        if t.type == TokenType.TRY:
            return self.parse_try()
        if t.type == TokenType.THROW:
            return self.parse_throw()
        if t.type == TokenType.MATCH:
            return self.parse_match()
        if t.type == TokenType.PRINT:
            return self.parse_print()

        return self.parse_expr_or_assign()

    def parse_var_decl(self, constant=False):
        t = self.advance()  # consume let/const
        name = self.expect(TokenType.IDENT, "Expected variable name").value
        value = None
        if self.match(TokenType.ASSIGN):
            value = self.parse_expr()
        return VarDecl(name, value, constant, line=t.line)

    def parse_fun_decl(self):
        t = self.advance()  # consume 'fun'
        name = self.expect(TokenType.IDENT, "Expected function name").value
        self.expect(TokenType.LPAREN)
        params, defaults = self.parse_params()
        self.expect(TokenType.RPAREN)
        self.expect(TokenType.LBRACE)
        body = self.parse_block()
        self.expect(TokenType.RBRACE)
        return FunDecl(name, params, defaults, body, line=t.line)

    def parse_params(self):
        params, defaults = [], []
        while not self.check(TokenType.RPAREN, TokenType.EOF):
            # Allow 'self' keyword as a parameter name in methods
            if self.current().type == TokenType.SELF:
                name = self.advance().value
            else:
                name = self.expect(TokenType.IDENT, "Expected parameter name").value
            params.append(name)
            if self.match(TokenType.ASSIGN):
                defaults.append(self.parse_expr())
            else:
                defaults.append(None)
            if not self.match(TokenType.COMMA):
                break
        return params, defaults

    def parse_return(self):
        t = self.advance()
        value = None
        if not self.check(TokenType.RBRACE, TokenType.EOF):
            value = self.parse_expr()
        return ReturnStmt(value, line=t.line)

    def parse_if(self):
        t = self.advance()
        cond = self.parse_expr()
        self.expect(TokenType.LBRACE)
        then_body = self.parse_block()
        self.expect(TokenType.RBRACE)
        elif_clauses = []
        else_body = None
        while self.check(TokenType.ELIF):
            self.advance()
            ec = self.parse_expr()
            self.expect(TokenType.LBRACE)
            eb = self.parse_block()
            self.expect(TokenType.RBRACE)
            elif_clauses.append((ec, eb))
        if self.match(TokenType.ELSE):
            self.expect(TokenType.LBRACE)
            else_body = self.parse_block()
            self.expect(TokenType.RBRACE)
        return IfStmt(cond, then_body, elif_clauses, else_body, line=t.line)

    def parse_while(self):
        t = self.advance()
        cond = self.parse_expr()
        self.expect(TokenType.LBRACE)
        body = self.parse_block()
        self.expect(TokenType.RBRACE)
        return WhileStmt(cond, body, line=t.line)

    def parse_for(self):
        t = self.advance()
        var = self.expect(TokenType.IDENT, "Expected loop variable").value
        self.expect(TokenType.IN, "Expected 'in'")
        iterable = self.parse_expr()
        self.expect(TokenType.LBRACE)
        body = self.parse_block()
        self.expect(TokenType.RBRACE)
        return ForStmt(var, iterable, body, line=t.line)

    def parse_import(self):
        t = self.advance()
        module = self.expect(TokenType.IDENT).value
        while self.match(TokenType.DOT):
            module += '.' + self.expect(TokenType.IDENT).value
        alias = None
        if self.match(TokenType.AS):
            alias = self.expect(TokenType.IDENT).value
        return ImportStmt(module, alias, [], line=t.line)

    def parse_from_import(self):
        t = self.advance()
        module = self.expect(TokenType.IDENT).value
        self.expect(TokenType.IMPORT, "Expected 'import'")
        names = [self.expect(TokenType.IDENT).value]
        while self.match(TokenType.COMMA):
            names.append(self.expect(TokenType.IDENT).value)
        return ImportStmt(module, None, names, line=t.line)

    def parse_class(self):
        t = self.advance()
        name = self.expect(TokenType.IDENT).value
        superclass = None
        if self.match(TokenType.LPAREN):
            superclass = self.expect(TokenType.IDENT).value
            self.expect(TokenType.RPAREN)
        self.expect(TokenType.LBRACE)
        methods = []
        while not self.check(TokenType.RBRACE, TokenType.EOF):
            if self.check(TokenType.FUN):
                methods.append(self.parse_fun_decl())
            else:
                methods.append(self.parse_statement())
        self.expect(TokenType.RBRACE)
        return ClassDecl(name, superclass, methods, line=t.line)

    def parse_try(self):
        t = self.advance()
        self.expect(TokenType.LBRACE)
        body = self.parse_block()
        self.expect(TokenType.RBRACE)
        catch_var = None
        catch_body = []
        finally_body = None
        if self.match(TokenType.CATCH):
            if self.match(TokenType.LPAREN):
                catch_var = self.expect(TokenType.IDENT).value
                self.expect(TokenType.RPAREN)
            self.expect(TokenType.LBRACE)
            catch_body = self.parse_block()
            self.expect(TokenType.RBRACE)
        if self.match(TokenType.FINALLY):
            self.expect(TokenType.LBRACE)
            finally_body = self.parse_block()
            self.expect(TokenType.RBRACE)
        return TryStmt(body, catch_var, catch_body, finally_body, line=t.line)

    def parse_throw(self):
        t = self.advance()
        val = self.parse_expr()
        return ThrowStmt(val, line=t.line)

    def parse_match(self):
        t = self.advance()
        subject = self.parse_expr()
        self.expect(TokenType.LBRACE)
        cases = []
        while not self.check(TokenType.RBRACE, TokenType.EOF):
            self.expect(TokenType.CASE, "Expected 'case'")
            if self.check(TokenType.IDENT) and self.current().value == '_':
                self.advance()
                pattern = None
            else:
                pattern = self.parse_expr()
            self.expect(TokenType.ARROW)
            self.expect(TokenType.LBRACE)
            body = self.parse_block()
            self.expect(TokenType.RBRACE)
            cases.append((pattern, body))
        self.expect(TokenType.RBRACE)
        return MatchStmt(subject, cases, line=t.line)

    def parse_print(self):
        t = self.advance()
        self.expect(TokenType.LPAREN)
        values = []
        if not self.check(TokenType.RPAREN):
            values.append(self.parse_expr())
            while self.match(TokenType.COMMA):
                values.append(self.parse_expr())
        self.expect(TokenType.RPAREN)
        return PrintStmt(values, line=t.line)

    def parse_expr_or_assign(self):
        line = self.current().line
        expr = self.parse_expr()

        # Compound assignment
        compound = {
            TokenType.PLUS_EQ: '+=', TokenType.MINUS_EQ: '-=',
            TokenType.STAR_EQ: '*=', TokenType.SLASH_EQ: '/=',
        }
        for tt, op in compound.items():
            if self.match(tt):
                val = self.parse_expr()
                return AssignStmt(expr, val, op, line=line)

        if self.match(TokenType.ASSIGN):
            val = self.parse_expr()
            return AssignStmt(expr, val, '=', line=line)

        return ExprStmt(expr, line=line)

    def parse_block(self):
        stmts = []
        while not self.check(TokenType.RBRACE, TokenType.EOF):
            s = self.parse_statement()
            if s:
                stmts.append(s)
        return stmts

    # ── Expressions ───────────────────────────────────────────────────────────

    def parse_expr(self):
        return self.parse_ternary()

    def parse_ternary(self):
        start_line = self.current().line
        node = self.parse_or()
        if self.current().type == TokenType.IF and self.current().line == start_line:
            self.advance()
            cond = self.parse_or()
            self.expect(TokenType.ELSE, "Expected else in ternary")
            else_val = self.parse_or()
            return TernaryExpr(cond, node, else_val)
        return node

    def parse_or(self):
        node = self.parse_and()
        while self.check(TokenType.OR):
            op = self.advance().value
            right = self.parse_and()
            node = BinOp(node, op, right)
        return node

    def parse_and(self):
        node = self.parse_not()
        while self.check(TokenType.AND):
            op = self.advance().value
            right = self.parse_not()
            node = BinOp(node, op, right)
        return node

    def parse_not(self):
        if self.check(TokenType.NOT):
            op = self.advance().value
            return UnaryOp(op, self.parse_not())
        return self.parse_comparison()

    def parse_comparison(self):
        node = self.parse_range()
        cmp_types = {
            TokenType.EQ, TokenType.NEQ, TokenType.LT,
            TokenType.GT, TokenType.LTE, TokenType.GTE, TokenType.IS,
        }
        while self.current().type in cmp_types:
            op = self.advance().value
            right = self.parse_range()
            node = BinOp(node, op, right)
        return node

    def parse_range(self):
        node = self.parse_additive()
        if self.match(TokenType.DOTDOT):
            end = self.parse_additive()
            step = None
            if self.match(TokenType.COLON):
                step = self.parse_additive()
            return RangeExpr(node, end, step)
        return node

    def parse_additive(self):
        node = self.parse_multiplicative()
        while self.current().type in (TokenType.PLUS, TokenType.MINUS):
            op = self.advance().value
            right = self.parse_multiplicative()
            node = BinOp(node, op, right)
        return node

    def parse_multiplicative(self):
        node = self.parse_power()
        while self.current().type in (TokenType.STAR, TokenType.SLASH, TokenType.PERCENT):
            op = self.advance().value
            right = self.parse_power()
            node = BinOp(node, op, right)
        return node

    def parse_power(self):
        node = self.parse_unary()
        if self.match(TokenType.POWER):
            right = self.parse_power()
            return BinOp(node, '**', right)
        return node

    def parse_unary(self):
        if self.current().type == TokenType.MINUS:
            op = self.advance().value
            return UnaryOp('-', self.parse_unary())
        return self.parse_call_member()

    def parse_call_member(self):
        node = self.parse_primary()
        while True:
            if self.match(TokenType.LPAREN):
                args, kwargs = self.parse_args()
                self.expect(TokenType.RPAREN)
                node = CallExpr(node, args, kwargs)
            elif self.match(TokenType.LBRACKET):
                idx = self.parse_expr()
                self.expect(TokenType.RBRACKET)
                node = IndexExpr(node, idx)
            elif self.match(TokenType.DOT):
                attr = self.expect(TokenType.IDENT).value
                node = MemberExpr(node, attr)
            else:
                break
        return node

    def parse_args(self):
        args, kwargs = [], {}
        while not self.check(TokenType.RPAREN, TokenType.EOF):
            if self.check(TokenType.IDENT) and self.peek().type == TokenType.ASSIGN:
                key = self.advance().value
                self.advance()
                kwargs[key] = self.parse_expr()
            else:
                args.append(self.parse_expr())
            if not self.match(TokenType.COMMA):
                break
        return args, kwargs

    def parse_primary(self):
        t = self.current()

        if t.type == TokenType.NUMBER:
            self.advance()
            return Literal(t.value, line=t.line)
        if t.type == TokenType.FLOAT:
            self.advance()
            return Literal(t.value, line=t.line)
        if t.type == TokenType.STRING:
            self.advance()
            return Literal(t.value, line=t.line)
        if t.type == TokenType.BOOL:
            self.advance()
            return Literal(t.value, line=t.line)
        if t.type == TokenType.NULL:
            self.advance()
            return Literal(None, line=t.line)
        if t.type == TokenType.SELF:
            self.advance()
            return SelfExpr(line=t.line)
        if t.type == TokenType.SUPER:
            self.advance()
            self.expect(TokenType.DOT)
            method = self.expect(TokenType.IDENT).value
            self.expect(TokenType.LPAREN)
            args, _ = self.parse_args()
            self.expect(TokenType.RPAREN)
            return SuperExpr(method, args, line=t.line)
        if t.type == TokenType.NEW:
            self.advance()
            name = self.expect(TokenType.IDENT).value
            self.expect(TokenType.LPAREN)
            args, _ = self.parse_args()
            self.expect(TokenType.RPAREN)
            return NewExpr(name, args, line=t.line)
        if t.type == TokenType.IDENT:
            self.advance()
            return Identifier(t.value, line=t.line)
        if t.type == TokenType.LPAREN:
            self.advance()
            expr = self.parse_expr()
            self.expect(TokenType.RPAREN)
            return expr
        if t.type == TokenType.LBRACKET:
            return self.parse_list()
        if t.type == TokenType.LBRACE:
            return self.parse_dict()
        if t.type == TokenType.FUN:
            return self.parse_lambda()

        self.error(f"Unexpected token {t.type.name} ({t.value!r})")

    def parse_list(self):
        t = self.advance()  # [
        elements = []
        while not self.check(TokenType.RBRACKET, TokenType.EOF):
            elements.append(self.parse_expr())
            if not self.match(TokenType.COMMA):
                break
        self.expect(TokenType.RBRACKET)
        return ListLiteral(elements, line=t.line)

    def parse_dict(self):
        t = self.advance()  # {
        pairs = []
        while not self.check(TokenType.RBRACE, TokenType.EOF):
            key = self.parse_expr()
            self.expect(TokenType.COLON)
            val = self.parse_expr()
            pairs.append((key, val))
            if not self.match(TokenType.COMMA):
                break
        self.expect(TokenType.RBRACE)
        return DictLiteral(pairs, line=t.line)

    def parse_lambda(self):
        t = self.advance()  # consume 'fun'
        self.expect(TokenType.LPAREN)
        params, _ = self.parse_params()
        self.expect(TokenType.RPAREN)
        self.expect(TokenType.ARROW)

        # নতুন লজিক: যদি { থাকে তবে ব্লক পার্স করো, নাহলে এক্সপ্রেশন
        if self.check(TokenType.LBRACE):
            self.advance()          # consume '{'
            body = self.parse_block()
            self.expect(TokenType.RBRACE)
            return LambdaExpr(params, body, line=t.line, is_block=True)
        else:
            body = self.parse_expr()
            return LambdaExpr(params, body, line=t.line, is_block=False)
