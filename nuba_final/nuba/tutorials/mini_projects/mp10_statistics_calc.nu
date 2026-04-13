# Mini Project: Statistics Calculator
# Build a Statistics Calculator using Nuba

print("=== Statistics Calculator ===")

class Statisticscalc {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Statistics Calculator")
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

let app = new Statisticscalc()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
