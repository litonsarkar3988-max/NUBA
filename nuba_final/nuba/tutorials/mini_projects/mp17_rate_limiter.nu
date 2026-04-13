# Mini Project: Rate Limiter Algorithm
# Build a Rate Limiter Algorithm using Nuba

print("=== Rate Limiter Algorithm ===")

class Ratelimiter {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Rate Limiter Algorithm")
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

let app = new Ratelimiter()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
