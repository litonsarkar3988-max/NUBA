# Generator Pattern

Simulate generators with closures.

```nuba
fun range_gen(start, end_val) {
    let cur = start
    return fun() -> {
        if cur >= end_val { return null }
        let v = cur; cur += 1; return v
    }
}
let gen = range_gen(0, 5)
let v = gen()
while v != null { print(v); v = gen() }
```
