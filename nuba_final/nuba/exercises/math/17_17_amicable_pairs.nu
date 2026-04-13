# Math Exercise 17: Amicable number pairs

# Amicable number pairs

fun solve_17_amicable_pairs(n) {
    print("Computing: Amicable number pairs")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_17_amicable_pairs(10)
print("Result:", output)
