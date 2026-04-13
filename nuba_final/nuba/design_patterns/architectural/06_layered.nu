# Design Pattern: Layered
# Category: Architectural

print("=== Layered Pattern ===")
print("Category: Architectural")
print()

# Layered implementation in Nuba

class LayeredPattern {
    fun init(self) {
        self.name     = "Layered"
        self.category = "architectural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Layered to:", context)
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
        print("\nDemonstration: Layered")
        print("Intent: Solve common design problems using Layered")
        print("Use when:")
        print("  1. You need layered behavior")
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

let pattern = new LayeredPattern()
pattern.demonstrate()
pattern.examples()
print("\nLayered implementation complete!")
