# Functions in Nuba

## Basic Functions

```nuba
fun add(a, b) {
    return a + b
}
print(add(3, 4))  # 7
```

## Default Parameters

```nuba
fun greet(name, times = 1) {
    for i in 0..times {
        print("Hello,", name)
    }
}
greet("Alice")      # once
greet("Bob", 3)     # three times
```

## Lambda Functions

```nuba
# Expression lambda
let double = fun(x) -> x * 2

# Block lambda (new!)
let process = fun(x) -> {
    let y = x * 2
    let z = y + 10
    return z
}
```

## Higher-Order Functions

```nuba
let nums = [1, 2, 3, 4, 5]
let evens  = filter(fun(x) -> x % 2 == 0, nums)
let doubled = map(fun(x) -> x * 2, nums)
let total   = reduce(fun(a, b) -> a + b, nums)
```

## Closures

```nuba
fun make_counter() {
    let count = 0
    fun increment() {
        count += 1
        return count
    }
    return increment
}
let counter = make_counter()
print(counter())  # 1
print(counter())  # 2
```
