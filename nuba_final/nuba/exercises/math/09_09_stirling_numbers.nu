# Math Exercise 09: Stirling numbers

# Stirling numbers

fun solve_09_stirling_numbers(n) {
    print("Computing: Stirling numbers")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_09_stirling_numbers(10)
print("Result:", output)
