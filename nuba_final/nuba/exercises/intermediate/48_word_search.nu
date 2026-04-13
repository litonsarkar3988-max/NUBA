# Intermediate: Word Search in Grid
fun word_search(board, word) {
    let rows = len(board)
    let cols = len(board[0])
    fun dfs(r, c, idx) {
        if idx == len(word) { return true }
        if r < 0 or r >= rows or c < 0 or c >= cols { return false }
        if board[r][c] != substr(word, idx, idx+1) { return false }
        let temp = board[r][c]
        board[r][c] = "#"
        let found = dfs(r+1,c,idx+1) or dfs(r-1,c,idx+1) or
                    dfs(r,c+1,idx+1) or dfs(r,c-1,idx+1)
        board[r][c] = temp
        return found
    }
    for r in 0..rows {
        for c in 0..cols {
            if dfs(r, c, 0) { return true }
        }
    }
    return false
}
let board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]]
print(word_search(board, "ABCCED"))
print(word_search(board, "SEE"))
print(word_search(board, "ABCB"))
