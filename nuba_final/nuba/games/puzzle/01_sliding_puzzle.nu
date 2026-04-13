# Game: 15-Puzzle Solver


class SlidingPuzzle {
    fun init(self, size) {
        self.size  = size
        self.board = []
        let n = size * size
        for i in 0..n { push(self.board, i) }
        self.empty_pos = n - 1
    }
    fun shuffle_board(self, moves) {
        let dirs = [[-1,0],[1,0],[0,-1],[0,1]]
        for i in 0..moves {
            let valid = []
            let r = floor(self.empty_pos / self.size)
            let c = self.empty_pos % self.size
            for d in dirs {
                let nr = r+d[0]; let nc = c+d[1]
                if nr>=0 and nr<self.size and nc>=0 and nc<self.size {
                    push(valid, nr*self.size+nc)
                }
            }
            let swap_pos = choice(valid)
            let tmp = self.board[self.empty_pos]
            self.board[self.empty_pos] = self.board[swap_pos]
            self.board[swap_pos] = tmp
            self.empty_pos = swap_pos
        }
    }
    fun is_solved(self) {
        for i in 0..len(self.board)-1 {
            if self.board[i] != i { return false }
        }
        return true
    }
    fun display(self) {
        print("=== Sliding Puzzle ===")
        for r in 0..self.size {
            let row = ""
            for c in 0..self.size {
                let val = self.board[r*self.size+c]
                let s = " " if val==len(self.board)-1 else str(val)
                row += " " + s
            }
            print(row)
        }
    }
    fun manhattan_distance(self) {
        let dist = 0
        for i in 0..len(self.board) {
            let val = self.board[i]
            if val == len(self.board)-1 { continue }
            let cur_r = floor(i/self.size)
            let cur_c = i % self.size
            let goal_r = floor(val/self.size)
            let goal_c = val % self.size
            dist += abs(cur_r-goal_r) + abs(cur_c-goal_c)
        }
        return dist
    }
}
let puzzle = new SlidingPuzzle(3)
puzzle.shuffle_board(20)
puzzle.display()
print("Manhattan distance:", puzzle.manhattan_distance())
print("Solved:", puzzle.is_solved())
