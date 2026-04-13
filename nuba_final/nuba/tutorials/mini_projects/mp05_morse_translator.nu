# Mini Project: Morse Code Translator
# Build a Morse Code Translator using Nuba

print("=== Morse Code Translator ===")

class Morsetranslator {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Morse Code Translator")
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

let app = new Morsetranslator()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
