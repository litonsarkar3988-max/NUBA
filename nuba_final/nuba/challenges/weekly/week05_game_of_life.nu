# Weekly Challenge 5: Conway's Game of Life
# This is a larger project challenge — build Conway's Game of Life in Nuba

print("=== Conway's Game of Life ===")
print("Challenge: Implement Conway's Game of Life")
print()

class Week05Gameoflife {
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
        print("Starting: Conway's Game of Life")
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
        print("=== Conway's Game of Life Report ===")
        print("Items processed:", len(self.results))
        print("Config:", self.config)
    }
}

let system = new Week05Gameoflife()
system.configure("mode","production").configure("max_items",1000)
system.start()
for i in 1..6 { system.process(i*10) }
system.stop()
system.report()
