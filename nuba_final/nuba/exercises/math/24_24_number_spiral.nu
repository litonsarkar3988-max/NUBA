# Math Exercise 24: Number spiral matrix

# Number spiral matrix

fun solve_24_number_spiral(n) {
    print("Computing: Number spiral matrix")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_24_number_spiral(10)
print("Result:", output)
