# nuba/tokens.py - Token definitions for the Nuba language

from enum import Enum, auto

class TokenType(Enum):
    # Literals
    NUMBER    = auto()
    FLOAT     = auto()
    STRING    = auto()
    BOOL      = auto()
    NULL      = auto()

    # Identifiers & Keywords
    IDENT     = auto()
    LET       = auto()
    CONST     = auto()
    FUN       = auto()
    RETURN    = auto()
    IF        = auto()
    ELIF      = auto()
    ELSE      = auto()
    WHILE     = auto()
    FOR       = auto()
    IN        = auto()
    BREAK     = auto()
    CONTINUE  = auto()
    IMPORT    = auto()
    FROM      = auto()
    AS        = auto()
    CLASS     = auto()
    NEW       = auto()
    SELF      = auto()
    SUPER     = auto()
    TRY       = auto()
    CATCH     = auto()
    FINALLY   = auto()
    THROW     = auto()
    MATCH     = auto()
    CASE      = auto()
    AND       = auto()
    OR        = auto()
    NOT       = auto()
    IS        = auto()
    PRINT     = auto()

    # Operators
    PLUS      = auto()
    MINUS     = auto()
    STAR      = auto()
    SLASH     = auto()
    PERCENT   = auto()
    POWER     = auto()
    EQ        = auto()
    NEQ       = auto()
    LT        = auto()
    GT        = auto()
    LTE       = auto()
    GTE       = auto()
    ASSIGN    = auto()
    PLUS_EQ   = auto()
    MINUS_EQ  = auto()
    STAR_EQ   = auto()
    SLASH_EQ  = auto()
    ARROW     = auto()
    DOT       = auto()
    DOTDOT    = auto()

    # Delimiters
    LPAREN    = auto()
    RPAREN    = auto()
    LBRACE    = auto()
    RBRACE    = auto()
    LBRACKET  = auto()
    RBRACKET  = auto()
    COMMA     = auto()
    COLON     = auto()
    SEMICOLON = auto()
    NEWLINE   = auto()
    PIPE      = auto()

    # Special
    EOF       = auto()
    COMMENT   = auto()


class Token:
    def __init__(self, type_: TokenType, value, line: int = 0, col: int = 0):
        self.type = type_
        self.value = value
        self.line = line
        self.col = col

    def __repr__(self):
        return f"Token({self.type.name}, {self.value!r}, line={self.line})"


KEYWORDS = {
    "let":      TokenType.LET,
    "const":    TokenType.CONST,
    "fun":      TokenType.FUN,
    "return":   TokenType.RETURN,
    "if":       TokenType.IF,
    "elif":     TokenType.ELIF,
    "else":     TokenType.ELSE,
    "while":    TokenType.WHILE,
    "for":      TokenType.FOR,
    "in":       TokenType.IN,
    "break":    TokenType.BREAK,
    "continue": TokenType.CONTINUE,
    "import":   TokenType.IMPORT,
    "from":     TokenType.FROM,
    "as":       TokenType.AS,
    "class":    TokenType.CLASS,
    "new":      TokenType.NEW,
    "self":     TokenType.SELF,
    "super":    TokenType.SUPER,
    "try":      TokenType.TRY,
    "catch":    TokenType.CATCH,
    "finally":  TokenType.FINALLY,
    "throw":    TokenType.THROW,
    "match":    TokenType.MATCH,
    "case":     TokenType.CASE,
    "and":      TokenType.AND,
    "or":       TokenType.OR,
    "not":      TokenType.NOT,
    "is":       TokenType.IS,
    "true":     TokenType.BOOL,
    "false":    TokenType.BOOL,
    "null":     TokenType.NULL,
    "print":    TokenType.PRINT,
}
