# Math Exercise 41: Discrete logarithm (baby-step)

# Discrete logarithm (baby-step)

fun solve_41_discrete_log(n) {
    print("Computing: Discrete logarithm (baby-step)")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_41_discrete_log(10)
print("Result:", output)
