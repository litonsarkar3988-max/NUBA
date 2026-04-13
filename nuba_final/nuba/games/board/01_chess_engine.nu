# Game: Chess Engine (simplified)


class ChessBoard {
    fun init(self) {
        self.board = [
            ["r","n","b","q","k","b","n","r"],
            ["p","p","p","p","p","p","p","p"],
            [".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[
            "P","P","P","P","P","P","P","P"],
            ["R","N","B","Q","K","B","N","R"]
        ]
        self.turn = "white"
        self.moves = []
    }
    fun display(self) {
        print("  a b c d e f g h")
        for r in 0..8 {
            let row = str(8-r) + " "
            for c in 0..8 { row += self.board[r][c] + " " }
            print(row)
        }
        print("Turn:", self.turn)
    }
    fun algebraic_to_idx(self, pos) {
        let col = ord(substr(pos,0,1)) - ord("a")
        let row = 8 - int(substr(pos,1,2))
        return [row, col]
    }
    fun move_piece(self, from_pos, to_pos) {
        let f = self.algebraic_to_idx(from_pos)
        let t = self.algebraic_to_idx(to_pos)
        let piece = self.board[f[0]][f[1]]
        if piece == "." { print("No piece at", from_pos); return false }
        push(self.moves, from_pos + to_pos)
        self.board[t[0]][t[1]] = piece
        self.board[f[0]][f[1]] = "."
        self.turn = "black" if self.turn == "white" else "white"
        print(piece, "moved", from_pos, "->", to_pos)
        return true
    }
    fun piece_count(self) {
        let counts = {}
        for row in self.board {
            for p in row {
                if p != "." {
                    if has(counts, p) { counts[p] += 1 } else { counts[p] = 1 }
                }
            }
        }
        return counts
    }
}
let chess = new ChessBoard()
chess.display()
print()
chess.move_piece("e2","e4")
chess.move_piece("e7","e5")
chess.move_piece("g1","f3")
chess.display()
print("Pieces:", chess.piece_count())
