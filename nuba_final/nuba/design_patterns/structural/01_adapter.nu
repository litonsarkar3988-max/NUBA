# Design Pattern: Adapter
# Category: Structural

print("=== Adapter Pattern ===")
print("Category: Structural")
print()

# Adapter implementation in Nuba

class AdapterPattern {
    fun init(self) {
        self.name     = "Adapter"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Adapter to:", context)
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
        print("\nDemonstration: Adapter")
        print("Intent: Solve common design problems using Adapter")
        print("Use when:")
        print("  1. You need adapter behavior")
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

let pattern = new AdapterPattern()
pattern.demonstrate()
pattern.examples()
print("\nAdapter implementation complete!")
