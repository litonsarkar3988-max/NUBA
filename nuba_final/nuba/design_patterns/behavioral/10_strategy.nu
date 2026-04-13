# Design Pattern: Strategy
# Category: Behavioral

print("=== Strategy Pattern ===")
print("Category: Behavioral")
print()

# Strategy implementation in Nuba

class StrategyPattern {
    fun init(self) {
        self.name     = "Strategy"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Strategy to:", context)
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
        print("\nDemonstration: Strategy")
        print("Intent: Solve common design problems using Strategy")
        print("Use when:")
        print("  1. You need strategy behavior")
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

let pattern = new StrategyPattern()
pattern.demonstrate()
pattern.examples()
print("\nStrategy implementation complete!")
