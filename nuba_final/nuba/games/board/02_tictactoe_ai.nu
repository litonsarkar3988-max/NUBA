# Game: Tic-Tac-Toe with AI


class TicTacToe {
    fun init(self) {
        self.board = [".",".",".",".",".",".",".",".","."]
        self.current = "X"
    }
    fun display(self) {
        for i in 0..3 {
            print(self.board[i*3], self.board[i*3+1], self.board[i*3+2])
        }
    }
    fun check_winner(self) {
        let wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
        for w in wins {
            if self.board[w[0]] != "." and self.board[w[0]] == self.board[w[1]] and self.board[w[1]] == self.board[w[2]] {
                return self.board[w[0]]
            }
        }
        if not self.board.contains(".") { return "Draw" }
        return null
    }
    fun minimax(self, is_max) {
        let winner = self.check_winner()
        if winner == "X" { return 10 }
        if winner == "O" { return -10 }
        if winner == "Draw" { return 0 }
        let best = -1000 if is_max else 1000
        for i in 0..9 {
            if self.board[i] == "." {
                self.board[i] = "X" if is_max else "O"
                let score = self.minimax(not is_max)
                self.board[i] = "."
                if is_max and score > best { best = score }
                elif not is_max and score < best { best = score }
            }
        }
        return best
    }
    fun best_move(self) {
        let best_score = -1000
        let best_pos = -1
        for i in 0..9 {
            if self.board[i] == "." {
                self.board[i] = "X"
                let score = self.minimax(false)
                self.board[i] = "."
                if score > best_score { best_score = score; best_pos = i }
            }
        }
        return best_pos
    }
    fun play_move(self, pos) {
        if self.board[pos] != "." { return false }
        self.board[pos] = self.current
        self.current = "O" if self.current == "X" else "X"
        return true
    }
}
let game = new TicTacToe()
game.play_move(4)
print("Player plays center:")
game.display()
let ai_move = game.best_move()
game.play_move(ai_move)
print("\nAI plays position", ai_move, ":")
game.display()
print("Winner:", game.check_winner())
