# Math Exercise 25: Zigzag matrix filling

# Zigzag matrix filling

fun solve_25_zigzag_matrix(n) {
    print("Computing: Zigzag matrix filling")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_25_zigzag_matrix(10)
print("Result:", output)
