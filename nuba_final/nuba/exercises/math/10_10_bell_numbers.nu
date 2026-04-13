# Math Exercise 10: Bell numbers

# Bell numbers

fun solve_10_bell_numbers(n) {
    print("Computing: Bell numbers")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_10_bell_numbers(10)
print("Result:", output)
