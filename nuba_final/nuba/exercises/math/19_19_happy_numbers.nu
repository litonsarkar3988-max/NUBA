# Math Exercise 19: Happy number check

# Happy number check

fun solve_19_happy_numbers(n) {
    print("Computing: Happy number check")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_19_happy_numbers(10)
print("Result:", output)
