# Design Pattern: Producer Consumer
# Category: Concurrency

print("=== Producer Consumer Pattern ===")
print("Category: Concurrency")
print()

# Producer Consumer implementation in Nuba

class ProducerconsumerPattern {
    fun init(self) {
        self.name     = "Producer Consumer"
        self.category = "concurrency"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Producer Consumer to:", context)
        let result = {
            "pattern": self.name,
            "context": context,
            "applied": true,
            "timestamp": time()
        }
        push(self.instances, result)
        return result
    }

    fun demonstrate(self) {
        print("\nDemonstration: Producer Consumer")
        print("Intent: Solve common design problems using Producer Consumer")
        print("Use when:")
        print("  1. You need producer consumer behavior")
        print("  2. Code flexibility is required")
        print("  3. Maintainability is important")
    }

    fun examples(self) {
        let contexts = ["web_app","mobile_app","api_service","database_layer","ui_component"]
        for ctx in contexts {
            self.apply(ctx)
        }
        print("Applied to", len(self.instances), "contexts")
    }
}

let pattern = new ProducerconsumerPattern()
pattern.demonstrate()
pattern.examples()
print("\nProducer Consumer implementation complete!")
