# Mini Project: URL Shortener Simulation
# Build a URL Shortener Simulation using Nuba

print("=== URL Shortener Simulation ===")

class Urlshortener {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: URL Shortener Simulation")
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

let app = new Urlshortener()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
