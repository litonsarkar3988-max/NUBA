# Mini Project: Roman Numeral Calculator
# Build a Roman Numeral Calculator using Nuba

print("=== Roman Numeral Calculator ===")

class Romancalculator {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Roman Numeral Calculator")
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

let app = new Romancalculator()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
