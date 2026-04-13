# Math Exercise 22: Latin square check

# Latin square check

fun solve_22_latin_square(n) {
    print("Computing: Latin square check")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_22_latin_square(10)
print("Result:", output)
