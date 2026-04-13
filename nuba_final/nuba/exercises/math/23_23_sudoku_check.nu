# Math Exercise 23: Sudoku validator

# Sudoku validator

fun solve_23_sudoku_check(n) {
    print("Computing: Sudoku validator")
    # Implementation
    let result = []
    for i in 1..(n+1) {
        push(result, i)
    }
    return result
}

let output = solve_23_sudoku_check(10)
print("Result:", output)
