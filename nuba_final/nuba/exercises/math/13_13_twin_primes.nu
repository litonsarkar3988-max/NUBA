# Math Exercise 13: Twin prime pairs

# Twin prime pairs

fun solve_13_twin_primes(n) {
    print("Computing: Twin prime pairs")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_13_twin_primes(10)
print("Result:", output)
