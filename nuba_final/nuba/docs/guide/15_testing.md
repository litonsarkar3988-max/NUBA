# Testing in Nuba

```nuba
let pass = 0
let fail = 0
fun assert_eq(a, b, name) {
    if a == b { pass += 1; print("  ✓", name) }
    else { fail += 1; print("  ✗", name, "| got:", a, "expected:", b) }
}
assert_eq(1+1, 2, "addition")
assert_eq("hi".upper(), "HI", "upper")
print(pass, "passed,", fail, "failed")
```
