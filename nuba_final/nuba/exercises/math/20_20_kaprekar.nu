# Math Exercise 20: Kaprekar constant

# Kaprekar constant

fun solve_20_kaprekar(n) {
    print("Computing: Kaprekar constant")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_20_kaprekar(10)
print("Result:", output)
