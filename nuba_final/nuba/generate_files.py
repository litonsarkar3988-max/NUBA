#!/usr/bin/env python3
"""
generate_files.py  —  Generates 6000 valid Nuba (.nu) source files
Run:  python generate_files.py
"""

import os
import random

BASE = os.path.join(os.path.dirname(__file__), "generated")
random.seed(42)

# ── helpers ───────────────────────────────────────────────────────────────────

def write(path, content):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

def p(path, content):
    write(os.path.join(BASE, path), content)

counter = [0]
def uid():
    counter[0] += 1
    return counter[0]

# ── 1. MATH FILES (600 files) ─────────────────────────────────────────────────

MATH_OPS   = [("+","sum"), ("-","diff"), ("*","prod"), ("/","quot"), ("%","mod"), ("**","pow")]
MATH_NAMES = ["alpha","beta","gamma","delta","epsilon","zeta","eta","theta",
              "iota","kappa","lambda_","mu","nu","xi","pi_","rho","sigma",
              "tau","upsilon","phi","chi","psi","omega"]

# 600 arithmetic exercises
for i in range(1, 601):
    a = random.randint(1, 100)
    b = random.randint(1, 50)
    op, name = random.choice(MATH_OPS)
    if op == "/" and b == 0: b = 1
    if op == "/" : expr = f"round({a} / {b}, 4)"
    else:          expr = f"{a} {op} {b}"
    var = random.choice(MATH_NAMES)
    p(f"math/math_{i:04d}.nu", f"""\
# math/math_{i:04d}.nu  —  arithmetic exercise #{i}

let {var} = {expr}
print("{name}({a}, {b}) =", {var})

fun double_{name}(x) {{ return x * 2 }}
fun square_{name}(x) {{ return x * x }}
fun negate_{name}(x) {{ return -x }}

print("double =",  double_{name}({var}))
print("square =",  square_{name}({a}))
print("negate =",  negate_{name}({b}))
""")

# ── 2. STRING FILES (600 files) ───────────────────────────────────────────────

WORDS  = ["nuba","language","python","code","data","logic","function",
          "class","loop","string","number","value","program","compiler",
          "parser","token","lexer","ast","runtime","scope","closure",
          "lambda","method","object","interface","module","package"]

STR_OPS = [
    ("upper",    "upper(s)"),
    ("lower",    "lower(s)"),
    ("reversed", "join(reversed(s.chars()), \"\")"),
    ("trim",     "trim(s)"),
    ("length",   "len(s)"),
    ("repeat3",  "s.repeat(3)"),
]