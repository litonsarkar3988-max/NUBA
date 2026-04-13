# Design Pattern: Data Locality
# Category: Game Patterns

print("=== Data Locality Pattern ===")
print("Category: Game Patterns")
print()

# Data Locality implementation in Nuba

class DatalocalityPattern {
    fun init(self) {
        self.name     = "Data Locality"
        self.category = "game_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Data Locality to:", context)
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
        print("\nDemonstration: Data Locality")
        print("Intent: Solve common design problems using Data Locality")
        print("Use when:")
        print("  1. You need data locality behavior")
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

let pattern = new DatalocalityPattern()
pattern.demonstrate()
pattern.examples()
print("\nData Locality implementation complete!")
