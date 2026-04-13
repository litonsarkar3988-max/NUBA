# Design Pattern: Balking
# Category: Concurrency

print("=== Balking Pattern ===")
print("Category: Concurrency")
print()

# Balking implementation in Nuba

class BalkingPattern {
    fun init(self) {
        self.name     = "Balking"
        self.category = "concurrency"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Balking to:", context)
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
        print("\nDemonstration: Balking")
        print("Intent: Solve common design problems using Balking")
        print("Use when:")
        print("  1. You need balking behavior")
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

let pattern = new BalkingPattern()
pattern.demonstrate()
pattern.examples()
print("\nBalking implementation complete!")
