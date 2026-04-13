# nuba/runner.py - File execution helpers

from .lexer import Lexer
from .parser import Parser
from .interpreter import Interpreter
from .environment import Environment


def run_source(source: str, filename: str = "<stdin>") -> Interpreter:
    """Lex, parse and run Nuba source code. Returns the interpreter."""
    tokens = Lexer(source, filename).tokenize()
    ast    = Parser(tokens, filename).parse()
    interp = Interpreter(filename)
    interp.run(ast)
    return interp


def run_file(path: str) -> Interpreter:
    """Run a .nu file and return the interpreter."""
    with open(path, 'r', encoding='utf-8') as f:
        source = f.read()
    return run_source(source, path)


def run_file_to_env(path: str) -> Environment:
    """Run a .nu file as a module and return its global env."""
    interp = run_file(path)
    return interp.globals
