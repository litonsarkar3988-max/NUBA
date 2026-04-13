# examples/functional.nu - Functional programming in Nuba

print("=== Closures ===")
fun make_counter(start) {
    let count = start
    fun increment() {
        count += 1
        return count
    }
    return increment
}

let counter = make_counter(0)
print(counter())   # 1
print(counter())   # 2
print(counter())   # 3

print("\n=== Currying ===")
fun curry_add(a) {
    return fun(b) -> a + b
}

let add10 = curry_add(10)
let add20 = curry_add(20)
print(add10(5))    # 15
print(add20(5))    # 25
print(map(add10, [1, 2, 3, 4, 5]))

print("\n=== Function Composition ===")
fun compose(f, g) {
    return fun(x) -> f(g(x))
}

fun double(x) { return x * 2 }
fun inc(x)    { return x + 1 }
fun square(x) { return x * x }

let double_then_inc = compose(inc, double)
let inc_then_square = compose(square, inc)

print(double_then_inc(5))   # 11
print(inc_then_square(4))   # 25

print("\n=== Memoize Pattern ===")
fun memoize(fn) {
    let cache = {}
    fun memoized(n) {
        if has(cache, n) { return cache[n] }
        let result = fn(n)
        cache[n] = result
        return result
    }
    return memoized
}

fun slow_fib(n) {
    if n <= 1 { return n }
    return slow_fib(n-1) + slow_fib(n-2)
}

# Memo version avoids recomputation
let fast_fib = memoize(slow_fib)
print("fib(10):", fast_fib(10))

print("\n=== Pipeline / Pipe Pattern ===")
fun pipe(value, fns) {
    let result = value
    for fn in fns {
        result = fn(result)
    }
    return result
}

let process = [
    fun(x) -> x * 2,
    fun(x) -> x + 10,
    fun(x) -> x * x
]
print("pipe(3, [...]):", pipe(3, process))  # ((3*2)+10)^2 = 256

print("\n=== Partial Application ===")
fun partial(fn, arg1) {
    return fun(arg2) -> fn(arg1, arg2)
}

fun multiply(a, b) { return a * b }
let triple = partial(multiply, 3)
let by_five = partial(multiply, 5)
print(map(triple, [1,2,3,4,5]))
print(map(by_five, [1,2,3,4,5]))

print("\n=== Lazy Evaluation (generator pattern) ===")
fun make_range_gen(start, end_val, step) {
    let current = start
    fun next() {
        if current >= end_val { return null }
        let val = current
        current += step
        return val
    }
    return next
}

let gen = make_range_gen(0, 10, 2)
let values = []
let v = gen()
while v != null {
    push(values, v)
    v = gen()
}
print("Generated:", values)

print("\n=== Once (run-only-once) ===")
fun once(fn) {
    let called = false
    let result = null
    fun wrapper(arg) {
        if not called {
            result = fn(arg)
            called = true
        }
        return result
    }
    return wrapper
}

fun expensive(x) {
    print("  (expensive called with", x, ")")
    return x * 100
}

let run_once = once(expensive)
print(run_once(42))   # runs expensive
print(run_once(99))   # returns cached result
