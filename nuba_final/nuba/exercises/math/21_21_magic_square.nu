# Math Exercise 21: Magic square generator

# Magic square generator

fun solve_21_magic_square(n) {
    print("Computing: Magic square generator")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_21_magic_square(10)
print("Result:", output)
