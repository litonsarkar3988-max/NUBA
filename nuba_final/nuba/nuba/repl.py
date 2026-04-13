# nuba/repl.py - Interactive REPL for Nuba

import sys
from .lexer import Lexer
from .parser import Parser
from .interpreter import Interpreter
from .errors import NubaError
from .values import nuba_to_string

BANNER = """
╔══════════════════════════════════════╗
║   Nuba Language  v1.0.0             ║
║   Type 'exit()' or Ctrl-C to quit  ║
╚══════════════════════════════════════╝
"""

def run_repl():
    print(BANNER)
    interp = Interpreter("<repl>")
    buf = []
    depth = 0

    while True:
        try:
            prompt = "nuba> " if depth == 0 else "   .. "
            try:
                line = input(prompt)
            except EOFError:
                print("\nGoodbye!")
                break

            for ch in line:
                if ch == '{': depth += 1
                elif ch == '}': depth -= 1

            buf.append(line)

            if depth <= 0:
                source = "\n".join(buf)
                buf = []
                depth = 0
                if not source.strip():
                    continue
                try:
                    tokens = Lexer(source, "<repl>").tokenize()
                    ast    = Parser(tokens, "<repl>").parse()
                    # If last statement is ExprStmt, print result
                    from .ast_nodes import ExprStmt, Program
                    if ast.body:
                        last = ast.body[-1]
                        if isinstance(last, ExprStmt):
                            ast.body[-1] = last  # keep
                            # Execute all but last
                            interp.exec_block(ast.body[:-1], interp.globals)
                            val = interp.eval_expr(last.expr, interp.globals)
                            if val is not None:
                                print(f"=> {nuba_to_string(val)}")
                        else:
                            interp.exec_block(ast.body, interp.globals)
                except NubaError as e:
                    print(f"\033[91mError: {e}\033[0m")
                except SystemExit:
                    print("Goodbye!")
                    sys.exit(0)
                except KeyboardInterrupt:
                    buf = []
                    depth = 0
                    print()

        except KeyboardInterrupt:
            print("\nGoodbye!")
            break
