# Game: Sudoku Game


class Sudoku {
    fun init(self) {
        self.board = []
        for i in 0..9 {
            let row = []
            for j in 0..9 { push(row, 0) }
            push(self.board, row)
        }
    }
    fun is_valid(self, r, c, num) {
        for i in 0..9 {
            if self.board[r][i] == num { return false }
            if self.board[i][c] == num { return false }
        }
        let box_r = floor(r/3)*3
        let box_c = floor(c/3)*3
        for i in box_r..(box_r+3) {
            for j in box_c..(box_c+3) {
                if self.board[i][j] == num { return false }
            }
        }
        return true
    }
    fun solve(self) {
        for r in 0..9 {
            for c in 0..9 {
                if self.board[r][c] == 0 {
                    for num in 1..10 {
                        if self.is_valid(r, c, num) {
                            self.board[r][c] = num
                            if self.solve() { return true }
                            self.board[r][c] = 0
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    fun load(self, puzzle_str) {
        let chars = puzzle_str.chars()
        let idx = 0
        for r in 0..9 {
            for c in 0..9 {
                self.board[r][c] = int(chars[idx])
                idx += 1
            }
        }
    }
    fun display(self) {
        for r in 0..9 {
            if r % 3 == 0 and r > 0 { print("------+-------+------") }
            let row = ""
            for c in 0..9 {
                if c % 3 == 0 and c > 0 { row += " | " }
                row += " " + str(self.board[r][c])
            }
            print(row)
        }
    }
}
let su = new Sudoku()
su.load("530070000600195000098000060800060003400803001700020006060000280000419005000080079")
print("Puzzle:")
su.display()
su.solve()
print("\nSolved:")
su.display()
