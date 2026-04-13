#!/usr/bin/env python3
# nuba_cli.py  -  `nuba` command-line entry point
#
# Usage:
#   nuba my.nu           Run a Nuba file
#   nuba                 Start the REPL
#   nuba --version       Print version
#   nuba --ast my.nu     Dump AST
#   nuba --tokens my.nu  Dump tokens

import sys
import os
import argparse

# Ensure the project root is on the path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from nuba.errors import NubaError
from nuba import __version__


def main():
    parser = argparse.ArgumentParser(
        prog="nuba",
        description="Nuba programming language interpreter"
    )
    parser.add_argument("file", nargs="?", help=".nu source file to run")
    parser.add_argument("--version", "-v", action="store_true", help="Print version and exit")
    parser.add_argument("--ast",    action="store_true", help="Dump AST instead of running")
    parser.add_argument("--tokens", action="store_true", help="Dump tokens instead of running")
    parser.add_argument("--eval", "-e", metavar="CODE", help="Evaluate inline Nuba code")
    args = parser.parse_args()

    if args.version:
        print(f"Nuba {__version__}")
        sys.exit(0)

    if args.eval:
        _run_source(args.eval, "<eval>", args)
        sys.exit(0)

    if args.file:
        if not os.path.exists(args.file):
            print(f"nuba: error: file not found: '{args.file}'", file=sys.stderr)
            sys.exit(1)
        if not args.file.endswith(".nu"):
            print(f"nuba: warning: file does not have .nu extension", file=sys.stderr)
        with open(args.file, 'r', encoding='utf-8') as f:
            source = f.read()
        _run_source(source, args.file, args)
        sys.exit(0)

    # No file → start REPL
    from nuba.repl import run_repl
    run_repl()


def _run_source(source, filename, args):
    from nuba.lexer import Lexer
    from nuba.parser import Parser
    from nuba.runner import run_source

    if args.tokens:
        tokens = Lexer(source, filename).tokenize()
        for tok in tokens:
            print(tok)
        return

    if args.ast:
        import ast as pyast
        tokens = Lexer(source, filename).tokenize()
        tree   = Parser(tokens, filename).parse()
        _print_ast(tree, 0)
        return

    try:
        run_source(source, filename)
    except NubaError as e:
        print(f"\033[91m{e}\033[0m", file=sys.stderr)
        sys.exit(1)
    except SystemExit as e:
        sys.exit(e.code)
    except KeyboardInterrupt:
        print("\nInterrupted", file=sys.stderr)
        sys.exit(130)


def _print_ast(node, indent):
    prefix = "  " * indent
    name = type(node).__name__
    fields = {k: v for k, v in vars(node).items() if k != 'line'}
    child_fields = {k: v for k, v in fields.items()
                    if hasattr(v, '__dict__') or isinstance(v, list)}
    simple = {k: v for k, v in fields.items() if k not in child_fields}
    parts = ", ".join(f"{k}={v!r}" for k, v in simple.items())
    print(f"{prefix}{name}({parts})")
    for k, v in child_fields.items():
        if isinstance(v, list):
            print(f"{prefix}  [{k}]:")
            for item in v:
                if hasattr(item, '__dict__'):
                    _print_ast(item, indent + 2)
                else:
                    print(f"{'  '*(indent+2)}{item!r}")
        elif hasattr(v, '__dict__'):
            print(f"{prefix}  {k}:")
            _print_ast(v, indent + 2)


if __name__ == "__main__":
    main()
