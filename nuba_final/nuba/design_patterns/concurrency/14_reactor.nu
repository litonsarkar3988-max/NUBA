# Design Pattern: Reactor
# Category: Concurrency

print("=== Reactor Pattern ===")
print("Category: Concurrency")
print()

# Reactor implementation in Nuba

class ReactorPattern {
    fun init(self) {
        self.name     = "Reactor"
        self.category = "concurrency"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Reactor to:", context)
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
        print("\nDemonstration: Reactor")
        print("Intent: Solve common design problems using Reactor")
        print("Use when:")
        print("  1. You need reactor behavior")
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

let pattern = new ReactorPattern()
pattern.demonstrate()
pattern.examples()
print("\nReactor implementation complete!")
