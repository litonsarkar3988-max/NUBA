# Math Exercise 18: Collatz sequence length

# Collatz sequence length

fun solve_18_collatz(n) {
    print("Computing: Collatz sequence length")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_18_collatz(10)
print("Result:", output)
