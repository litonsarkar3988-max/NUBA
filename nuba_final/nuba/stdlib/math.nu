# stdlib/math.nu - Math standard library for Nuba

fun clamp(val, lo, hi) {
    if val < lo { return lo }
    if val > hi { return hi }
    return val
}

fun sign(x) {
    if x > 0 { return 1 }
    if x < 0 { return -1 }
    return 0
}

fun lerp(a, b, t) {
    return a + (b - a) * t
}

fun map_range(value, in_min, in_max, out_min, out_max) {
    return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
}

fun is_even(n) { return n % 2 == 0 }
fun is_odd(n)  { return n % 2 != 0 }

fun digits(n) {
    return split(str(abs(n)), "")
}

fun digit_sum(n) {
    let d = digits(n)
    let s = 0
    for ch in d { s += int(ch) }
    return s
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

fun primes_up_to(n) {
    return filter(fun(x) -> is_prime(x), 2..n)
}

fun factorial(n) {
    if n <= 1 { return 1 }
    return n * factorial(n - 1)
}

fun combinations(n, r) {
    return factorial(n) / (factorial(r) * factorial(n - r))
}

fun permutations(n, r) {
    return factorial(n) / factorial(n - r)
}
