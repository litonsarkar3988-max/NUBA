#!/usr/bin/env python3
# tests/run_tests.py - Python test runner for Nuba

import sys
import os
import subprocess

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))

from nuba.runner import run_file
from nuba.errors import NubaError

TEST_FILES = [
    ("Feature Tests",  "tests/test_features.nu"),
    ("Test Runner",    "tests/test_runner.nu"),
]

EXAMPLE_FILES = [
    "examples/hello.nu",
    "examples/variables.nu",
    "examples/fizzbuzz.nu",
    "examples/functions.nu",
    "examples/control_flow.nu",
    "examples/classes.nu",
    "examples/lists.nu",
    "examples/dicts.nu",
    "examples/errors.nu",
    "examples/math_ops.nu",
    "examples/algorithms.nu",
    "examples/my.nu",
]

GREEN  = "\033[92m"
RED    = "\033[91m"
YELLOW = "\033[93m"
RESET  = "\033[0m"

def run_nu_file(path):
    root = os.path.join(os.path.dirname(__file__), '..')
    full = os.path.join(root, path)
    try:
        run_file(full)
        return True, None
    except NubaError as e:
        return False, str(e)
    except Exception as e:
        return False, f"Python exception: {e}"

def main():
    print("=" * 50)
    print("  Nuba Language Test Suite")
    print("=" * 50)

    total_pass = 0
    total_fail = 0

    print(f"\n{YELLOW}--- Unit Tests ---{RESET}")
    for name, path in TEST_FILES:
        print(f"\nRunning: {name} ({path})")
        ok, err = run_nu_file(path)
        if ok:
            print(f"  {GREEN}✓ Passed{RESET}")
            total_pass += 1
        else:
            print(f"  {RED}✗ Failed: {err}{RESET}")
            total_fail += 1

    print(f"\n{YELLOW}--- Example Files (smoke test) ---{RESET}")
    for path in EXAMPLE_FILES:
        ok, err = run_nu_file(path)
        status = f"{GREEN}✓{RESET}" if ok else f"{RED}✗{RESET}"
        print(f"  {status} {path}")
        if not ok:
            print(f"    → {err}")
            total_fail += 1
        else:
            total_pass += 1

    print("\n" + "=" * 50)
    print(f"  Results: {GREEN}{total_pass} passed{RESET}, {RED}{total_fail} failed{RESET}")
    print("=" * 50)
    sys.exit(0 if total_fail == 0 else 1)

if __name__ == "__main__":
    os.chdir(os.path.join(os.path.dirname(__file__), '..'))
    main()
