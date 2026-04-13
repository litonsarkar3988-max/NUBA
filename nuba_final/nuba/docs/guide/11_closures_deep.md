# Deep Dive: Closures

Closures capture variables from enclosing scope.

```nuba
fun make_counter(start) {
    let n = start
    return fun() -> { n += 1; return n }
}
let c = make_counter(0)
print(c())  # 1
print(c())  # 2
```
