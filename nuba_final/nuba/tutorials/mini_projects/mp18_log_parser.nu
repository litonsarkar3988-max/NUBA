# Mini Project: Log File Parser & Analyzer
# Build a Log File Parser & Analyzer using Nuba

print("=== Log File Parser & Analyzer ===")

class Logparser {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Log File Parser & Analyzer")
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

let app = new Logparser()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
