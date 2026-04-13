# Mini Project: Maze Generator (DFS)
# Build a Maze Generator (DFS) using Nuba

print("=== Maze Generator (DFS) ===")

class Mazegenerator {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Maze Generator (DFS)")
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

let app = new Mazegenerator()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
