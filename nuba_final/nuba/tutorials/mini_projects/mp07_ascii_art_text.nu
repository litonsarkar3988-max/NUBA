# Mini Project: ASCII Art Text Generator
# Build a ASCII Art Text Generator using Nuba

print("=== ASCII Art Text Generator ===")

class Asciiarttext {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: ASCII Art Text Generator")
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

let app = new Asciiarttext()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
