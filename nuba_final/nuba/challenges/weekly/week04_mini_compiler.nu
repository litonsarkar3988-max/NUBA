# Weekly Challenge 4: Mini Expression Compiler
# This is a larger project challenge — build Mini Expression Compiler in Nuba

print("=== Mini Expression Compiler ===")
print("Challenge: Implement Mini Expression Compiler")
print()

class Week04Minicompiler {
    fun init(self) {
        self.data    = []
        self.config  = {}
        self.running = false
        self.results = []
    }

    fun configure(self, key, value) {
        self.config[key] = value
        return self
    }

    fun start(self) {
        self.running = true
        print("Starting: Mini Expression Compiler")
        return self
    }

    fun process(self, input) {
        push(self.data, input)
        let result = self._transform(input)
        push(self.results, result)
        return result
    }

    fun _transform(self, x) {
        return x
    }

    fun stop(self) {
        self.running = false
        print("Stopped. Processed:", len(self.results), "items")
    }

    fun report(self) {
        print("=== Mini Expression Compiler Report ===")
        print("Items processed:", len(self.results))
        print("Config:", self.config)
    }
}

let system = new Week04Minicompiler()
system.configure("mode","production").configure("max_items",1000)
system.start()
for i in 1..6 { system.process(i*10) }
system.stop()
system.report()
