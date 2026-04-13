# Mini Project: Conway's Game of Life
# Build a Conway's Game of Life using Nuba

print("=== Conway's Game of Life ===")

class Lifesimulation {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Conway's Game of Life")
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

let app = new Lifesimulation()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
