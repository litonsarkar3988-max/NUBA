# Mini Project: Unit Converter (length, weight, temp)
# Build a Unit Converter (length, weight, temp) using Nuba

print("=== Unit Converter (length, weight, temp) ===")

class Unitconverter {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Unit Converter (length, weight, temp)")
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

let app = new Unitconverter()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
