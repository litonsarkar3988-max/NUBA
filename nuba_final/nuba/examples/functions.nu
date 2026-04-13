# examples/functions.nu - Functions in Nuba

# Basic function
fun greet(name) {
    return "Hello, " + name + "!"
}
print(greet("Alice"))

# Function with default parameters
fun power(base, exp = 2) {
    return base ** exp
}
print(power(3))       # 9
print(power(2, 10))   # 1024

# Recursive function
fun factorial(n) {
    if n <= 1 { return 1 }
    return n * factorial(n - 1)
}
print("10! =", factorial(10))

# Fibonacci with memoization
let memo = {}
fun fib(n) {
    if n <= 1 { return n }
    if has(memo, n) { return memo[n] }
    let result = fib(n - 1) + fib(n - 2)
    memo[n] = result
    return result
}
print("fib(20) =", fib(20))

# Higher-order functions
fun apply(fn, value) {
    return fn(value)
}

fun double(x) { return x * 2 }
fun square(x) { return x * x }

print(apply(double, 5))   # 10
print(apply(square, 5))   # 25

# Lambda functions
let add = fun(a, b) -> a + b
let mul = fun(a, b) -> a * b

print(add(3, 4))    # 7
print(mul(3, 4))    # 12

# Functions returning functions (closures)
fun make_adder(n) {
    return fun(x) -> x + n
}
let add5 = make_adder(5)
let add10 = make_adder(10)
print(add5(3))    # 8
print(add10(3))   # 13

# Variadic-style with lists
fun sum_all(nums) {
    let total = 0
    for n in nums {
        total += n
    }
    return total
}
print("Sum:", sum_all([1, 2, 3, 4, 5]))

# Map / filter / reduce
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let evens   = filter(fun(x) -> x % 2 == 0, numbers)
let doubled = map(fun(x) -> x * 2, evens)
let total   = reduce(fun(a, b) -> a + b, doubled)
print("Result:", total)   # 60
