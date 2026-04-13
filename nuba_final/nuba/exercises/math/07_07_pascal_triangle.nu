# Math Exercise 07: Pascal's triangle generation

# Pascal's triangle generation

fun solve_07_pascal_triangle(n) {
    print("Computing: Pascal's triangle generation")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_07_pascal_triangle(10)
print("Result:", output)
