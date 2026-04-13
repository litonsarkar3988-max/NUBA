# Math Exercise 33: Farey sequence

# Farey sequence

fun solve_33_farey_sequence(n) {
    print("Computing: Farey sequence")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_33_farey_sequence(10)
print("Result:", output)
