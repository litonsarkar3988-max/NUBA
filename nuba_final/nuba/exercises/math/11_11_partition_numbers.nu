# Math Exercise 11: Integer partition numbers

# Integer partition numbers

fun solve_11_partition_numbers(n) {
    print("Computing: Integer partition numbers")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_11_partition_numbers(10)
print("Result:", output)
