# Weekly Challenge 8: LRU + TTL Cache System
# This is a larger project challenge — build LRU + TTL Cache System in Nuba

print("=== LRU + TTL Cache System ===")
print("Challenge: Implement LRU + TTL Cache System")
print()

class Week08Cachesystem {
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
        print("Starting: LRU + TTL Cache System")
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
        print("=== LRU + TTL Cache System Report ===")
        print("Items processed:", len(self.results))
        print("Config:", self.config)
    }
}

let system = new Week08Cachesystem()
system.configure("mode","production").configure("max_items",1000)
system.start()
for i in 1..6 { system.process(i*10) }
system.stop()
system.report()
