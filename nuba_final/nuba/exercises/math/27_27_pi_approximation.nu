# Math Exercise 27: Pi approximation methods

# Pi approximation methods

fun solve_27_pi_approximation(n) {
    print("Computing: Pi approximation methods")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_27_pi_approximation(10)
print("Result:", output)
