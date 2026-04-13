# Math Exercise 15: Perfect number finder

# Perfect number finder

fun solve_15_perfect_numbers(n) {
    print("Computing: Perfect number finder")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_15_perfect_numbers(10)
print("Result:", output)
