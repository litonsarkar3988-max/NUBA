# Math Exercise 45: Number theory miscellaneous

# Number theory miscellaneous

fun solve_45_number_theory_misc(n) {
    print("Computing: Number theory miscellaneous")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_45_number_theory_misc(10)
print("Result:", output)
