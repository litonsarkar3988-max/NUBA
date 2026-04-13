# Nuba Programming Language

**Nuba** is a clean, expressive, dynamically-typed programming language implemented in Python.  
Write `.nu` files and run them just like Python!

---

## Quick Start

```bash
# Run a Nuba file
python nuba_cli.py my.nu

# Start the interactive REPL
python nuba_cli.py

# Evaluate inline code
python nuba_cli.py -e "print('Hello, Nuba!')"

# Print version
python nuba_cli.py --version

# Dump tokens (debug)
python nuba_cli.py --tokens my.nu

# Dump AST (debug)
python nuba_cli.py --ast my.nu
```

---

## Hello World

Create a file `hello.nu`:
```nuba
print("Hello, World!")
```

Run it:
```bash
python nuba_cli.py hello.nu
```

---

## Language Features

| Feature | Status |
|---------|--------|
| Variables (`let`, `const`) | ✅ |
| All data types (int, float, string, bool, null, list, dict) | ✅ |
| Arithmetic, comparison, logical operators | ✅ |
| `if / elif / else` | ✅ |
| `while` loops | ✅ |
| `for ... in` loops + ranges | ✅ |
| `break` / `continue` | ✅ |
| Functions with defaults | ✅ |
| Lambda expressions | ✅ |
| Closures | ✅ |
| Classes + Inheritance | ✅ |
| `self` / `super` | ✅ |
| `try / catch / finally` | ✅ |
| `throw` | ✅ |
| `match / case` | ✅ |
| Pattern matching | ✅ |
| `import` / `from ... import` | ✅ |
| List & string methods | ✅ |
| 70+ built-in functions | ✅ |
| Standard library (math, strings, collections) | ✅ |
| Interactive REPL | ✅ |

---

## Syntax Examples

```nuba
# Variables
let name = "Nuba"
const VERSION = 1

# Functions
fun greet(who, times = 1) {
    for i in 0..times {
        print("Hello, " + who + "!")
    }
}
greet("World", 3)

# Classes
class Dog {
    fun init(self, name) { self.name = name }
    fun bark(self) { print(self.name + " says Woof!") }
}
let d = new Dog("Rex")
d.bark()

# Error handling
try {
    throw "oops"
} catch (err) {
    print("Caught:", err)
}

# Pattern matching
match score {
    case 100 -> { print("Perfect!") }
    case _   -> { print("Keep trying") }
}

# Lambdas + functional
let evens = filter(fun(x) -> x % 2 == 0, 1..21)
print(evens)
```

---

## Project Structure

```
nuba/
├── nuba_cli.py          ← Main entry point (run this!)
├── nuba/
│   ├── __init__.py
│   ├── tokens.py        ← Token definitions
│   ├── lexer.py         ← Tokenizer
│   ├── ast_nodes.py     ← AST node types
│   ├── parser.py        ← Parser
│   ├── environment.py   ← Variable scopes
│   ├── values.py        ← Runtime value types
│   ├── builtins.py      ← 70+ built-in functions
│   ├── interpreter.py   ← Tree-walk interpreter
│   ├── runner.py        ← File runner helpers
│   ├── repl.py          ← Interactive REPL
│   └── errors.py        ← Error hierarchy
├── stdlib/
│   ├── math.nu          ← Math utilities
│   ├── strings.nu       ← String utilities
│   └── collections.nu   ← Collection utilities
├── examples/
│   ├── my.nu            ← Main demo (start here!)
│   ├── hello.nu
│   ├── variables.nu
│   ├── functions.nu
│   ├── classes.nu
│   ├── control_flow.nu
│   ├── strings.nu
│   ├── lists.nu
│   ├── dicts.nu
│   ├── errors.nu
│   ├── functional.nu
│   ├── pattern_match.nu
│   ├── algorithms.nu
│   ├── math_ops.nu
│   ├── fizzbuzz.nu
│   ├── calculator.nu
│   ├── linked_list.nu
│   ├── binary_tree.nu
│   └── todo_app.nu
├── tests/
│   └── test_runner.nu   ← Test suite
└── docs/
    └── syntax.md        ← Syntax reference
```

---

## Requirements

- Python 3.8+
- No external dependencies!

---

## License

MIT — Built with ❤️ for the Nuba Language Project
