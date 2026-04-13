# Weekly Challenge 2: Expense Tracker with Reports
# This is a larger project challenge — build Expense Tracker with Reports in Nuba

print("=== Expense Tracker with Reports ===")
print("Challenge: Implement Expense Tracker with Reports")
print()

class Week02Expensetracker {
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
        print("Starting: Expense Tracker with Reports")
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
        print("=== Expense Tracker with Reports Report ===")
        print("Items processed:", len(self.results))
        print("Config:", self.config)
    }
}

let system = new Week02Expensetracker()
system.configure("mode","production").configure("max_items",1000)
system.start()
for i in 1..6 { system.process(i*10) }
system.stop()
system.report()
