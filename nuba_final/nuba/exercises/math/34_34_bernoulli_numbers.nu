# Math Exercise 34: Bernoulli numbers

# Bernoulli numbers

fun solve_34_bernoulli_numbers(n) {
    print("Computing: Bernoulli numbers")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_34_bernoulli_numbers(10)
print("Result:", output)
