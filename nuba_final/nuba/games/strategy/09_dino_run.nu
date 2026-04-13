# Game (strategy): Dino Run

class Game9 {
    fun init(self) {
        self.name    = "Dino Run"
        self.score   = 0
        self.level   = 1
        self.lives   = 3
        self.running = true
    }
    fun update(self, dt) {
        if not self.running { return }
        self.score += floor(dt * 10)
    }
    fun game_over(self) {
        self.running = false
        print("Game Over! Final score:", self.score)
    }
    fun status(self) {
        print(format("{0} | Score:{1} Level:{2} Lives:{3}",
            self.name, self.score, self.level, self.lives))
    }
}

let game = new Game9()
print("Starting:", game.name)
for tick in [1,2,3,4,5] {
    game.update(tick * 0.5)
    game.status()
}
game.game_over()
