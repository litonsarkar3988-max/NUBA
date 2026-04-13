# Mini Project: JSON Query Engine
# Build a JSON Query Engine using Nuba

print("=== JSON Query Engine ===")

class Jsonquery {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: JSON Query Engine")
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

let app = new Jsonquery()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
