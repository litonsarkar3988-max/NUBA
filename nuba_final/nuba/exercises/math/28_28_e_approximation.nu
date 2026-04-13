# Math Exercise 28: Euler's number approximation

# Euler's number approximation

fun solve_28_e_approximation(n) {
    print("Computing: Euler's number approximation")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_28_e_approximation(10)
print("Result:", output)
