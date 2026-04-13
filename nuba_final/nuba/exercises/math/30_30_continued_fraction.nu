# Math Exercise 30: Continued fraction representation

# Continued fraction representation

fun solve_30_continued_fraction(n) {
    print("Computing: Continued fraction representation")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_30_continued_fraction(10)
print("Result:", output)
