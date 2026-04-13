# docs/syntax.md - Nuba Language Syntax Reference

## Nuba Language Syntax Reference

### 1. Comments
```
# This is a comment
```

### 2. Variables
```
let x = 10          # mutable
const PI = 3.14     # immutable
```

### 3. Types
| Type    | Example              |
|---------|----------------------|
| int     | `42`, `-7`           |
| float   | `3.14`, `-0.5`       |
| string  | `"hello"`, `'world'` |
| bool    | `true`, `false`      |
| null    | `null`               |
| list    | `[1, 2, 3]`          |
| dict    | `{"a": 1}`           |

### 4. Operators
```
+  -  *  /  %  **          # arithmetic
==  !=  <  >  <=  >=  is   # comparison
and  or  not               # logical
+=  -=  *=  /=             # compound assign
..                         # range
->                         # arrow (lambda)
```

### 5. Control Flow
```
if condition {
    ...
} elif other {
    ...
} else {
    ...
}

while condition { ... }

for x in iterable { ... }
for i in 0..10 { ... }     # range loop

break
continue
```

### 6. Functions
```
fun name(param1, param2 = default) {
    return value
}

# Lambda
let fn = fun(x) -> x * 2
```

### 7. Classes
```
class Animal {
    fun init(self, name) {
        self.name = name
    }
    fun speak(self) { ... }
}

class Dog(Animal) {
    fun init(self, name) {
        super.init(name)
    }
}

let d = new Dog("Rex")
d.speak()
```

### 8. Error Handling
```
try {
    throw "error message"
} catch (err) {
    print("Caught:", err)
} finally {
    print("Always runs")
}
```

### 9. Pattern Matching
```
match value {
    case 1    -> { ... }
    case "hi" -> { ... }
    case _    -> { ... }   # default
}
```

### 10. Built-in Functions
```
print(...)           len(x)          type(x)
int(x)  float(x)    str(x)          bool(x)
abs(x)  sqrt(x)     floor(x)        ceil(x)
round(x, n)         pow(a, b)       log(x, base)
min(...)  max(...)  sum(lst)        sorted(lst)
map(fn, lst)        filter(fn, lst) reduce(fn, lst)
zip(a, b)           enumerate(lst)
push(lst, x)        pop(lst)        insert(lst, i, x)
split(s, sep)       join(lst, sep)  trim(s)
upper(s)  lower(s)  replace(s,a,b)  contains(s, sub)
keys(d)   values(d) items(d)        has(d, key)
range(n)  list(x)   reversed(lst)
input(prompt)       exit(code)
readFile(path)      writeFile(path, data)
jsonParse(s)        jsonStringify(x)
random()  randint(a,b)  choice(lst)  shuffle(lst)
time()    sleep(n)
assert(cond, msg)
PI  E  INF
```

### 11. List Methods
```
lst.push(x)       lst.pop()         lst.length
lst.contains(x)   lst.indexOf(x)    lst.slice(a, b)
lst.join(sep)     lst.map(fn)       lst.filter(fn)
lst.forEach(fn)   lst.reverse()     lst.sort()
lst.flat()        lst.copy()        lst.clear()
lst.first         lst.last
```

### 12. String Methods
```
s.length          s.upper()         s.lower()
s.trim()          s.split(sep)      s.contains(sub)
s.startsWith(s)   s.endsWith(s)     s.replace(a, b)
s.indexOf(sub)    s.substr(a, b)    s.chars()
s.repeat(n)
```

### 13. Import
```
import math
import math as m
from collections import flatten, unique
```

### 14. Range
```
0..10          # 0 to 9 (exclusive end)
1..11          # 1 to 10
0..10:2        # 0, 2, 4, 6, 8 (with step)
list(0..5)     # convert to list
```
