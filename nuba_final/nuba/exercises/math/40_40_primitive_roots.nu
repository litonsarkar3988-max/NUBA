# Math Exercise 40: Primitive roots modulo n

# Primitive roots modulo n

fun solve_40_primitive_roots(n) {
    print("Computing: Primitive roots modulo n")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_40_primitive_roots(10)
print("Result:", output)
