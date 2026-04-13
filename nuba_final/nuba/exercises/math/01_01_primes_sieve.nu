# Math Exercise: Sieve of Eratosthenes

fun sieve(limit) {
    let is_prime = []
    for i in 0..(limit+1) { push(is_prime, true) }
    is_prime[0] = false; is_prime[1] = false
    let i = 2
    while i * i <= limit {
        if is_prime[i] {
            let j = i * i
            while j <= limit { is_prime[j] = false; j += i }
        }
        i += 1
    }
    let primes = []
    for i in 2..(limit+1) { if is_prime[i] { push(primes, i) } }
    return primes
}
let primes = sieve(100)
print("Primes up to 100:", primes)
print("Count:", len(primes))
