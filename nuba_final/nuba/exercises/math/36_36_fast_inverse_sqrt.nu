# Math Exercise 36: Fast inverse square root concept

# Fast inverse square root concept

fun solve_36_fast_inverse_sqrt(n) {
    print("Computing: Fast inverse square root concept")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_36_fast_inverse_sqrt(10)
print("Result:", output)
