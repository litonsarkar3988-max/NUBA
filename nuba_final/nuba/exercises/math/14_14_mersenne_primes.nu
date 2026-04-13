# Math Exercise 14: Mersenne prime check

# Mersenne prime check

fun solve_14_mersenne_primes(n) {
    print("Computing: Mersenne prime check")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_14_mersenne_primes(10)
print("Result:", output)
