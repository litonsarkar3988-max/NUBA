# Math Exercise 38: Extended Euclidean algorithm

# Extended Euclidean algorithm

fun solve_38_extended_gcd(n) {
    print("Computing: Extended Euclidean algorithm")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_38_extended_gcd(10)
print("Result:", output)
