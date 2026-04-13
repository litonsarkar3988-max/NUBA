# Math Exercise 35: Integer square root (Newton's method)

# Integer square root (Newton's method)

fun solve_35_integer_sqrt(n) {
    print("Computing: Integer square root (Newton's method)")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_35_integer_sqrt(10)
print("Result:", output)
