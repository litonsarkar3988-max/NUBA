# Mini Project: Mini Template Engine
# Build a Mini Template Engine using Nuba

print("=== Mini Template Engine ===")

class Templateengine {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Mini Template Engine")
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

let app = new Templateengine()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
