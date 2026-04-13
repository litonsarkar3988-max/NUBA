# Mini Project: Poker Hand Evaluator
# Build a Poker Hand Evaluator using Nuba

print("=== Poker Hand Evaluator ===")

class Pokerhand {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Poker Hand Evaluator")
    }

    fun process(self, input) {
        let result = str(input)
        push(self.data, result)
        return result
    }

    fun output(self) {
        print("Results:")
        for item in self.data { print("  -", item) }
        return self.data
    }
}

let app = new Pokerhand()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
