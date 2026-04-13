# Beginner Exercise 42: gcd

fun gcd(a, b) {
    while b != 0 {
        let t = b
        b = a % b
        a = t
    }
    return a
}
print("GCD(48,18):", gcd(48, 18))
