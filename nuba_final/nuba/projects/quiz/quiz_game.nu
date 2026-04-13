# Project: Quiz Game Engine
class Question {
    fun init(self, text, options, correct_idx) {
        self.text        = text
        self.options     = options
        self.correct_idx = correct_idx
    }
    fun is_correct(self, answer_idx) {
        return answer_idx == self.correct_idx
    }
    fun show(self, num) {
        print(format("Q{0}: {1}", num, self.text))
        for i in 0..len(self.options) {
            let marker = "→" if i == self.correct_idx else " "
            print(format("  {0} [{1}] {2}", marker, i+1, self.options[i]))
        }
    }
}
class Quiz {
    fun init(self, title) {
        self.title     = title
        self.questions = []
    }
    fun add(self, q) { push(self.questions, q); return self }
    fun simulate(self, answers) {
        print("=== " + self.title + " ===
")
        let score = 0
        for i in 0..len(self.questions) {
            let q = self.questions[i]
            q.show(i+1)
            let ans = answers[i]
            if q.is_correct(ans) {
                print("  ✓ Correct!
")
                score += 1
            } else {
                print(format("  ✗ Wrong! Correct: {0}
", q.options[q.correct_idx]))
            }
        }
        let pct = round(score * 100 / len(self.questions), 0)
        print(format("Score: {0}/{1} ({2}%)", score, len(self.questions), pct))
        if pct >= 80 { print("Excellent!") }
        elif pct >= 60 { print("Good job!") }
        else { print("Keep practicing!") }
    }
}
let quiz = new Quiz("Nuba Language Quiz")
quiz.add(new Question("What keyword declares a mutable variable?",
    ["const", "let", "var", "def"], 1))
quiz.add(new Question("Which operator is used for power?",
    ["+", "^", "**", "pow"], 2))
quiz.add(new Question("How do you create a class instance?",
    ["create", "new", "make", "init"], 1))
quiz.add(new Question("What does 'fun' keyword do?",
    ["Declares a variable", "Starts a loop", "Defines a function", "Imports a module"], 2))
quiz.add(new Question("What is the range operator?",
    ["..", "->", "=>", "::"], 0))
# Simulate with answers (0-indexed)
quiz.simulate([1, 2, 1, 2, 0])
