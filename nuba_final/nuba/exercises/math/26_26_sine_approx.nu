# Math Exercise 26: Taylor series sine approximation

# Taylor series sine approximation

fun solve_26_sine_approx(n) {
    print("Computing: Taylor series sine approximation")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_26_sine_approx(10)
print("Result:", output)
