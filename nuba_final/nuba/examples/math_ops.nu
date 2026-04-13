# examples/math_ops.nu - Math in Nuba

print("=== Basic Math ===")
print("abs(-42):", abs(-42))
print("pow(2, 8):", pow(2, 8))
print("sqrt(144):", sqrt(144))
print("floor(3.9):", floor(3.9))
print("ceil(3.1):", ceil(3.1))
print("round(3.14159, 2):", round(3.14159, 2))

print("\n=== Logarithms & Trig ===")
print("log(E):", round(log(E), 6))
print("log(100, 10):", log(100, 10))
print("sin(0):", sin(0))
print("cos(0):", cos(0))
print("PI:", round(PI, 6))

print("\n=== Min / Max / Sum ===")
let nums = [4, 7, 2, 9, 1, 5, 8, 3, 6]
print("List:", nums)
print("min:", min(nums))
print("max:", max(nums))
print("sum:", sum(nums))
print("avg:", sum(nums) / len(nums))

print("\n=== Statistics ===")
fun mean(data) {
    return sum(data) / len(data)
}

fun variance(data) {
    let m = mean(data)
    let diffs = map(fun(x) -> (x - m) * (x - m), data)
    return sum(diffs) / len(diffs)
}

fun std_dev(data) {
    return sqrt(variance(data))
}

fun median(data) {
    let s = sorted(data)
    let mid = floor(len(s) / 2)
    if len(s) % 2 == 0 {
        return (s[mid - 1] + s[mid]) / 2
    }
    return s[mid]
}

let data = [12, 45, 7, 23, 56, 34, 8, 90, 21, 67]
print("Data:", data)
print("Mean:", round(mean(data), 2))
print("Median:", median(data))
print("Variance:", round(variance(data), 2))
print("Std Dev:", round(std_dev(data), 2))

print("\n=== Number Theory ===")
fun is_prime(n) {
    if n < 2 { return false }
    if n == 2 { return true }
    if n % 2 == 0 { return false }
    let i = 3
    while i * i <= n {
        if n % i == 0 { return false }
        i += 2
    }
    return true
}

fun gcd(a, b) {
    while b != 0 {
        let t = b
        b = a % b
        a = t
    }
    return a
}

fun lcm(a, b) {
    return (a * b) / gcd(a, b)
}

let primes = filter(fun(n) -> is_prime(n), 1..50)
print("Primes < 50:", primes)
print("gcd(48, 18):", gcd(48, 18))
print("lcm(12, 18):", lcm(12, 18))

print("\n=== Fibonacci Sequence ===")
fun fib_seq(n) {
    let seq = [0, 1]
    let i = 2
    while i < n {
        push(seq, seq[i-1] + seq[i-2])
        i += 1
    }
    return seq
}
print("First 15 Fibonacci:", fib_seq(15))
