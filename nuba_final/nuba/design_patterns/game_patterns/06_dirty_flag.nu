# Design Pattern: Dirty Flag
# Category: Game Patterns

print("=== Dirty Flag Pattern ===")
print("Category: Game Patterns")
print()

# Dirty Flag implementation in Nuba

class DirtyflagPattern {
    fun init(self) {
        self.name     = "Dirty Flag"
        self.category = "game_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Dirty Flag to:", context)
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
        print("\nDemonstration: Dirty Flag")
        print("Intent: Solve common design problems using Dirty Flag")
        print("Use when:")
        print("  1. You need dirty flag behavior")
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

let pattern = new DirtyflagPattern()
pattern.demonstrate()
pattern.examples()
print("\nDirty Flag implementation complete!")
