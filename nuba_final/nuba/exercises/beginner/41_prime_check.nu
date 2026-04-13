# Beginner Exercise 41: prime_check

fun is_prime(n) {
    if n < 2 { return false }
    let i = 2
    while i * i <= n {
        if n % i == 0 { return false }
        i += 1
    }
    return true
}
print(is_prime(97))
print(is_prime(100))
