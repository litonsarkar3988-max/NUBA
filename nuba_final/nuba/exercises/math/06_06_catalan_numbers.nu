# Math Exercise 06: Catalan numbers sequence

# Catalan numbers sequence

fun solve_06_catalan_numbers(n) {
    print("Computing: Catalan numbers sequence")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_06_catalan_numbers(10)
print("Result:", output)
