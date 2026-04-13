# Design Pattern: Singleton Gp
# Category: Game Patterns

print("=== Singleton Gp Pattern ===")
print("Category: Game Patterns")
print()

# Singleton Gp implementation in Nuba

class SingletongpPattern {
    fun init(self) {
        self.name     = "Singleton Gp"
        self.category = "game_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Singleton Gp to:", context)
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
        print("\nDemonstration: Singleton Gp")
        print("Intent: Solve common design problems using Singleton Gp")
        print("Use when:")
        print("  1. You need singleton gp behavior")
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

let pattern = new SingletongpPattern()
pattern.demonstrate()
pattern.examples()
print("\nSingleton Gp implementation complete!")
