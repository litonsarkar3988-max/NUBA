# examples/decorators.nu - Decorator pattern in Nuba

# Timer decorator
fun timed(fn, label) {
    fun wrapper() {
        let start = time()
        let result = fn()
        let elapsed = time() - start
        print(format("[{0}] took {1}ms", label, round(elapsed * 1000, 2)))
        return result
    }
    return wrapper
}

# Logger decorator
fun logged(fn, name) {
    fun wrapper(x) {
        print(format("[LOG] calling {0}({1})", name, x))
        let result = fn(x)
        print(format("[LOG] {0} returned {1}", name, result))
        return result
    }
    return wrapper
}

# Retry decorator
fun retry(fn, max_attempts) {
    fun wrapper(x) {
        let attempts = 0
        while attempts < max_attempts {
            try {
                return fn(x)
            } catch (err) {
                attempts += 1
                print(format("Attempt {0} failed: {1}", attempts, err))
                if attempts >= max_attempts {
                    throw "Max retries exceeded: " + err
                }
            }
        }
    }
    return wrapper
}

# Memoize decorator
fun memoize(fn) {
    let cache = {}
    fun wrapper(x) {
        let key = str(x)
        if has(cache, key) {
            return cache[key]
        }
        let result = fn(x)
        cache[key] = result
        return result
    }
    return wrapper
}

# Validate decorator
fun validate_positive(fn) {
    fun wrapper(x) {
        if x <= 0 { throw "Input must be positive, got " + str(x) }
        return fn(x)
    }
    return wrapper
}

# --- Demo ---

print("=== Timed Decorator ===")
fun slow_sum() {
    let total = 0
    for i in 0..10000 { total += i }
    return total
}
let timed_sum = timed(slow_sum, "slow_sum")
print("Result:", timed_sum())

print("\n=== Logger Decorator ===")
fun double(x) { return x * 2 }
let logged_double = logged(double, "double")
logged_double(21)

print("\n=== Memoize Decorator ===")
fun slow_fib(n) {
    if n <= 1 { return n }
    return slow_fib(n-1) + slow_fib(n-2)
}
let fast_fib = memoize(slow_fib)
print("fib(15):", fast_fib(15))

print("\n=== Validate Decorator ===")
fun square_root(x) { return sqrt(x) }
let safe_sqrt = validate_positive(square_root)
try {
    print("sqrt(16):", safe_sqrt(16))
    print("sqrt(-1):", safe_sqrt(-1))
} catch (err) {
    print("Validation error:", err)
}

print("\n=== Retry Decorator ===")
let attempt_count = 0
fun flaky_fn(x) {
    attempt_count += 1
    if attempt_count < 3 {
        throw "Transient error #" + str(attempt_count)
    }
    return x * 100
}
let resilient = retry(flaky_fn, 5)
try {
    let result = resilient(42)
    print("Final result:", result)
} catch (err) {
    print("Failed:", err)
}
