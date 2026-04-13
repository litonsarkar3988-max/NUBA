# Design Pattern: Strangler
# Category: Architectural

print("=== Strangler Pattern ===")
print("Category: Architectural")
print()

# Strangler implementation in Nuba

class StranglerPattern {
    fun init(self) {
        self.name     = "Strangler"
        self.category = "architectural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Strangler to:", context)
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
        print("\nDemonstration: Strangler")
        print("Intent: Solve common design problems using Strangler")
        print("Use when:")
        print("  1. You need strangler behavior")
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

let pattern = new StranglerPattern()
pattern.demonstrate()
pattern.examples()
print("\nStrangler implementation complete!")
