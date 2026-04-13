# Built-in Functions Reference

## Type Functions
| Function | Description | Example |
|----------|-------------|---------|
| `type(x)` | Get type name | `type(42)` → `"int"` |
| `int(x)` | Convert to int | `int("42")` → `42` |
| `float(x)` | Convert to float | `float("3.14")` → `3.14` |
| `str(x)` | Convert to string | `str(100)` → `"100"` |
| `bool(x)` | Convert to bool | `bool(0)` → `false` |

## Math Functions
| Function | Description |
|----------|-------------|
| `abs(x)` | Absolute value |
| `sqrt(x)` | Square root |
| `floor(x)` | Round down |
| `ceil(x)` | Round up |
| `round(x, n)` | Round to n decimals |
| `pow(a, b)` | a to the power b |
| `log(x, base)` | Logarithm |
| `sin/cos/tan(x)` | Trigonometry |
| `min(lst)` | Minimum value |
| `max(lst)` | Maximum value |
| `sum(lst)` | Sum of list |

## String Functions
| Function | Description |
|----------|-------------|
| `len(s)` | String length |
| `upper(s)` | Uppercase |
| `lower(s)` | Lowercase |
| `trim(s)` | Strip whitespace |
| `split(s, sep)` | Split string |
| `join(lst, sep)` | Join list |
| `replace(s,a,b)` | Replace |
| `contains(s, sub)` | Check substring |
| `substr(s, a, b)` | Substring |
| `indexOf(s, sub)` | Find index |

## List Functions
| Function | Description |
|----------|-------------|
| `push(lst, x)` | Append item |
| `pop(lst)` | Remove last |
| `sorted(lst)` | Sort list |
| `reversed(lst)` | Reverse list |
| `map(fn, lst)` | Map function |
| `filter(fn, lst)` | Filter list |
| `reduce(fn, lst)` | Reduce list |
| `zip(a, b)` | Zip two lists |
| `enumerate(lst)` | Add indices |
