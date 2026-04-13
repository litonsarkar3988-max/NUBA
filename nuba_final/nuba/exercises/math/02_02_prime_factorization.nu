# Math Exercise: Prime Factorization

fun prime_factors(n) {
    let factors = []
    let d = 2
    while d * d <= n {
        while n % d == 0 { push(factors, d); n = floor(n/d) }
        d += 1
    }
    if n > 1 { push(factors, n) }
    return factors
}
for n in [12, 36, 100, 360, 1000] {
    print(n, "=", prime_factors(n))
}
