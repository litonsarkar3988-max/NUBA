# Math Exercise 16: Abundant and deficient numbers

# Abundant and deficient numbers

fun solve_16_abundant_deficient(n) {
    print("Computing: Abundant and deficient numbers")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_16_abundant_deficient(10)
print("Result:", output)
