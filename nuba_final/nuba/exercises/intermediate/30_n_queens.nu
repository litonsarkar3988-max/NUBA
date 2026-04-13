# Intermediate: N-Queens Problem
fun solve_nqueens(n) {
    let solutions = []
    fun is_safe(board, row, col) {
        for i in 0..row {
            if board[i] == col { return false }
            if abs(board[i] - col) == abs(i - row) { return false }
        }
        return true
    }
    fun solve(board, row) {
        if row == n { push(solutions, board.copy()); return }
        for col in 0..n {
            if is_safe(board, row, col) {
                push(board, col)
                solve(board, row + 1)
                pop(board)
            }
        }
    }
    solve([], 0)
    return solutions
}
let sols = solve_nqueens(4)
print("4-Queens solutions:", len(sols))
for sol in sols { print(sol) }
