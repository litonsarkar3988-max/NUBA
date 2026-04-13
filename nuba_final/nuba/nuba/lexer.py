# nuba/lexer.py - Lexer/Tokenizer for the Nuba language

from .tokens import Token, TokenType, KEYWORDS
from .errors import NubaLexError


class Lexer:
    def __init__(self, source: str, filename: str = "<stdin>"):
        self.source = source
        self.filename = filename
        self.pos = 0
        self.line = 1
        self.col = 1
        self.tokens = []

    def error(self, msg):
        raise NubaLexError(f"{self.filename}:{self.line}:{self.col}: {msg}")

    def peek(self, offset=0):
        idx = self.pos + offset
        if idx < len(self.source):
            return self.source[idx]
        return '\0'

    def advance(self):
        ch = self.source[self.pos]
        self.pos += 1
        if ch == '\n':
            self.line += 1
            self.col = 1
        else:
            self.col += 1
        return ch

    def match(self, ch):
        if self.pos < len(self.source) and self.source[self.pos] == ch:
            self.advance()
            return True
        return False

    def skip_whitespace(self):
        while self.pos < len(self.source) and self.source[self.pos] in ' \t\r':
            self.advance()

    def skip_comment(self):
        # Single line comment: # ...
        while self.pos < len(self.source) and self.source[self.pos] != '\n':
            self.advance()

    def read_string(self, quote):
        start_line = self.line
        start_col = self.col
        result = []
        while self.pos < len(self.source):
            ch = self.peek()
            if ch == '\\':
                self.advance()
                esc = self.advance()
                escapes = {'n': '\n', 't': '\t', 'r': '\r', '\\': '\\',
                           '"': '"', "'": "'", '0': '\0'}
                result.append(escapes.get(esc, esc))
            elif ch == quote:
                self.advance()
                break
            elif ch == '\0':
                self.error(f"Unterminated string starting at line {start_line}")
            else:
                result.append(self.advance())
        return ''.join(result)

    def read_number(self):
        start = self.pos - 1
        is_float = False
        while self.pos < len(self.source) and self.source[self.pos].isdigit():
            self.advance()
        if self.pos < len(self.source) and self.source[self.pos] == '.' \
                and self.pos + 1 < len(self.source) and self.source[self.pos+1].isdigit():
            is_float = True
            self.advance()  # consume '.'
            while self.pos < len(self.source) and self.source[self.pos].isdigit():
                self.advance()
        text = self.source[start:self.pos]
        if is_float:
            return TokenType.FLOAT, float(text)
        return TokenType.NUMBER, int(text)

    def read_ident(self):
        start = self.pos - 1
        while self.pos < len(self.source) and (self.source[self.pos].isalnum() or self.source[self.pos] == '_'):
            self.advance()
        text = self.source[start:self.pos]
        ttype = KEYWORDS.get(text, TokenType.IDENT)
        if text == 'true':
            return ttype, True
        if text == 'false':
            return ttype, False
        if text == 'null':
            return TokenType.NULL, None
        return ttype, text

    def tokenize(self):
        while self.pos < len(self.source):
            self.skip_whitespace()
            if self.pos >= len(self.source):
                break

            line, col = self.line, self.col
            ch = self.advance()

            if ch == '\n':
                self.tokens.append(Token(TokenType.NEWLINE, '\n', line, col))
                continue
            if ch == '#':
                self.skip_comment()
                continue

            # Strings
            if ch in ('"', "'"):
                val = self.read_string(ch)
                self.tokens.append(Token(TokenType.STRING, val, line, col))
                continue

            # Numbers
            if ch.isdigit():
                ttype, val = self.read_number()
                self.tokens.append(Token(ttype, val, line, col))
                continue

            # Identifiers / keywords
            if ch.isalpha() or ch == '_':
                ttype, val = self.read_ident()
                self.tokens.append(Token(ttype, val, line, col))
                continue

            # Operators & delimiters
            simple = {
                '(': TokenType.LPAREN, ')': TokenType.RPAREN,
                '{': TokenType.LBRACE,  '}': TokenType.RBRACE,
                '[': TokenType.LBRACKET,']': TokenType.RBRACKET,
                ',': TokenType.COMMA,   ':': TokenType.COLON,
                ';': TokenType.SEMICOLON,'|': TokenType.PIPE,
            }
            if ch in simple:
                self.tokens.append(Token(simple[ch], ch, line, col))
                continue

            if ch == '+':
                if self.match('='):
                    self.tokens.append(Token(TokenType.PLUS_EQ, '+=', line, col))
                else:
                    self.tokens.append(Token(TokenType.PLUS, '+', line, col))
            elif ch == '-':
                if self.match('>'):
                    self.tokens.append(Token(TokenType.ARROW, '->', line, col))
                elif self.match('='):
                    self.tokens.append(Token(TokenType.MINUS_EQ, '-=', line, col))
                else:
                    self.tokens.append(Token(TokenType.MINUS, '-', line, col))
            elif ch == '*':
                if self.match('*'):
                    self.tokens.append(Token(TokenType.POWER, '**', line, col))
                elif self.match('='):
                    self.tokens.append(Token(TokenType.STAR_EQ, '*=', line, col))
                else:
                    self.tokens.append(Token(TokenType.STAR, '*', line, col))
            elif ch == '/':
                if self.match('='):
                    self.tokens.append(Token(TokenType.SLASH_EQ, '/=', line, col))
                else:
                    self.tokens.append(Token(TokenType.SLASH, '/', line, col))
            elif ch == '%':
                self.tokens.append(Token(TokenType.PERCENT, '%', line, col))
            elif ch == '=':
                if self.match('='):
                    self.tokens.append(Token(TokenType.EQ, '==', line, col))
                else:
                    self.tokens.append(Token(TokenType.ASSIGN, '=', line, col))
            elif ch == '!':
                if self.match('='):
                    self.tokens.append(Token(TokenType.NEQ, '!=', line, col))
                else:
                    self.error(f"Unexpected character '!'")
            elif ch == '<':
                if self.match('='):
                    self.tokens.append(Token(TokenType.LTE, '<=', line, col))
                else:
                    self.tokens.append(Token(TokenType.LT, '<', line, col))
            elif ch == '>':
                if self.match('='):
                    self.tokens.append(Token(TokenType.GTE, '>=', line, col))
                else:
                    self.tokens.append(Token(TokenType.GT, '>', line, col))
            elif ch == '.':
                if self.match('.'):
                    self.tokens.append(Token(TokenType.DOTDOT, '..', line, col))
                else:
                    self.tokens.append(Token(TokenType.DOT, '.', line, col))
            else:
                self.error(f"Unexpected character {ch!r}")

        self.tokens.append(Token(TokenType.EOF, None, self.line, self.col))
        return self.tokens
