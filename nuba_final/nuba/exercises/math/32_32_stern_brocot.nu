# Math Exercise 32: Stern-Brocot tree

# Stern-Brocot tree

fun solve_32_stern_brocot(n) {
    print("Computing: Stern-Brocot tree")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_32_stern_brocot(10)
print("Result:", output)
