# Design Pattern: State Gp
# Category: Game Patterns

print("=== State Gp Pattern ===")
print("Category: Game Patterns")
print()

# State Gp implementation in Nuba

class StategpPattern {
    fun init(self) {
        self.name     = "State Gp"
        self.category = "game_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying State Gp to:", context)
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
        print("\nDemonstration: State Gp")
        print("Intent: Solve common design problems using State Gp")
        print("Use when:")
        print("  1. You need state gp behavior")
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

let pattern = new StategpPattern()
pattern.demonstrate()
pattern.examples()
print("\nState Gp implementation complete!")
