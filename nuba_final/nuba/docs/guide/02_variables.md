# Variables in Nuba

## Mutable Variables

```nuba
let name = "Alice"
let age  = 30
let pi   = 3.14
name = "Bob"    # OK - mutable
```

## Constants

```nuba
const MAX_SIZE = 100
const PI = 3.14159
# MAX_SIZE = 200  # ERROR: cannot reassign constant
```

## Types

| Type    | Example          |
|---------|------------------|
| int     | `42`, `-7`       |
| float   | `3.14`           |
| string  | `"hello"`        |
| bool    | `true`, `false`  |
| null    | `null`           |
| list    | `[1, 2, 3]`      |
| dict    | `{"a": 1}`       |

## Type Conversion

```nuba
let n = int("42")
let f = float("3.14")
let s = str(100)
let b = bool(1)
```
