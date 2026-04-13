# Design Pattern: Factory Method
# Category: Creational

print("=== Factory Method Pattern ===")
print("Category: Creational")
print()

# Factory Method implementation in Nuba

class FactorymethodPattern {
    fun init(self) {
        self.name     = "Factory Method"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Factory Method to:", context)
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
        print("\nDemonstration: Factory Method")
        print("Intent: Solve common design problems using Factory Method")
        print("Use when:")
        print("  1. You need factory method behavior")
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

let pattern = new FactorymethodPattern()
pattern.demonstrate()
pattern.examples()
print("\nFactory Method implementation complete!")
