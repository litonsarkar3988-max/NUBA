# CHANGELOG - Nuba Language

## v1.0.0 (2024)

### Core Language
- Variables: `let` (mutable) and `const` (immutable)
- Types: int, float, string, bool, null, list, dict
- Arithmetic operators: `+`, `-`, `*`, `/`, `%`, `**`
- Comparison operators: `==`, `!=`, `<`, `>`, `<=`, `>=`, `is`
- Logical operators: `and`, `or`, `not`
- Compound assignment: `+=`, `-=`, `*=`, `/=`
- Range operator: `..` (exclusive end, e.g. `0..10`)

### Control Flow
- `if / elif / else` conditionals
- `while` loops
- `for ... in` loops (lists, dicts, strings, ranges)
- `break` and `continue`
- Ternary expressions: `val if cond else other`

### Functions
- Named functions with `fun`
- Default parameter values
- Lambda/anonymous functions: `fun(x) -> expr`
- Closures (functions capture enclosing scope)
- First-class functions (pass, return, store)
- Recursion

### Classes & OOP
- `class` keyword with methods
- Single inheritance via `class Child(Parent)`
- `self` for instance reference
- `super.method(...)` for super calls
- `new ClassName(args)` for instantiation
- Method chaining support

### Error Handling
- `try / catch / finally`
- `throw` any value
- Nested try/catch

### Pattern Matching
- `match / case` with default (`case _`)

### Modules
- `import module`
- `import module as alias`
- `from module import name1, name2`
- Standard library: math, strings, collections, io, datetime, random

### Built-in Functions (70+)
- Type: `type`, `int`, `float`, `str`, `bool`
- Math: `abs`, `sqrt`, `floor`, `ceil`, `round`, `pow`, `log`, `sin`, `cos`, `tan`
- Collections: `len`, `push`, `pop`, `insert`, `remove`, `sorted`, `reversed`, `map`, `filter`, `reduce`, `zip`, `enumerate`
- Strings: `upper`, `lower`, `trim`, `split`, `join`, `replace`, `contains`, `substr`, `indexOf`, `format`
- Dict: `keys`, `values`, `items`, `has`
- I/O: `print`, `input`, `readFile`, `writeFile`
- Random: `random`, `randint`, `choice`, `shuffle`
- Misc: `time`, `sleep`, `exit`, `assert`, `jsonParse`, `jsonStringify`

### Tooling
- `nuba file.nu` — run a file
- `nuba` — interactive REPL
- `nuba -e "code"` — eval inline
- `nuba --ast file.nu` — dump AST
- `nuba --tokens file.nu` — dump tokens
- `nuba --version` — print version

### List Methods
`.push()`, `.pop()`, `.length`, `.contains()`, `.indexOf()`, `.slice()`, `.join()`, `.map()`, `.filter()`, `.forEach()`, `.reverse()`, `.sort()`, `.flat()`, `.copy()`, `.clear()`, `.first`, `.last`

### String Methods
`.length`, `.upper()`, `.lower()`, `.trim()`, `.split()`, `.contains()`, `.startsWith()`, `.endsWith()`, `.replace()`, `.indexOf()`, `.substr()`, `.chars()`, `.repeat()`
