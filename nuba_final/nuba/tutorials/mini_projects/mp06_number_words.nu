# Mini Project: Number to Words Converter
# Build a Number to Words Converter using Nuba

print("=== Number to Words Converter ===")

class Numberwords {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Number to Words Converter")
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

let app = new Numberwords()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
