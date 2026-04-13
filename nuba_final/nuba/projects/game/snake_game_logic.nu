# Project: Snake Game Logic (non-interactive)
class SnakeGame {
    fun init(self, width, height) {
        self.width  = width
        self.height = height
        self.snake  = [[height/2, width/2]]
        self.direction = "RIGHT"
        self.food   = [2, 2]
        self.score  = 0
        self.alive  = true
    }
    fun set_direction(self, dir) {
        let opposites = {"UP":"DOWN","DOWN":"UP","LEFT":"RIGHT","RIGHT":"LEFT"}
        if dir != opposites[self.direction] { self.direction = dir }
    }
    fun move(self) {
        if not self.alive { return }
        let head = self.snake[0]
        let new_head = [head[0], head[1]]
        if self.direction == "UP"    { new_head[0] -= 1 }
        elif self.direction == "DOWN"  { new_head[0] += 1 }
        elif self.direction == "LEFT"  { new_head[1] -= 1 }
        elif self.direction == "RIGHT" { new_head[1] += 1 }
        if new_head[0] < 0 or new_head[0] >= self.height or
           new_head[1] < 0 or new_head[1] >= self.width {
            self.alive = false
            print("Game Over! Hit wall. Score:", self.score)
            return
        }
        for seg in self.snake {
            if seg[0] == new_head[0] and seg[1] == new_head[1] {
                self.alive = false
                print("Game Over! Hit self. Score:", self.score)
                return
            }
        }
        self.snake = [new_head] + self.snake
        if new_head[0] == self.food[0] and new_head[1] == self.food[1] {
            self.score += 10
            self.food = [randint(0, self.height-1), randint(0, self.width-1)]
            print("Ate food! Score:", self.score)
        } else {
            self.snake = self.snake.slice(0, len(self.snake)-1)
        }
    }
    fun status(self) {
        print(format("Snake: {0} | Food: {1} | Score: {2} | Dir: {3}",
                     self.snake, self.food, self.score, self.direction))
    }
}
let game = new SnakeGame(10, 10)
game.food = [5, 6]
game.status()
game.move(); game.move(); game.move()
game.set_direction("DOWN")
game.move(); game.move()
game.status()
