# Challenge: Check if Prime
fun is_prime(n) {
    if n < 2 { return false }
    let i = 2
    while i * i <= n {
        if n % i == 0 { return false }
        i += 1
    }
    return true
}
for n in [2,3,4,5,11,12,13,97,100] { print(n, is_prime(n)) }
