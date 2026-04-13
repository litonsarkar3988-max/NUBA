# Math Exercise 08: Binomial coefficients

# Binomial coefficients

fun solve_08_binomial_coeff(n) {
    print("Computing: Binomial coefficients")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_08_binomial_coeff(10)
print("Result:", output)
