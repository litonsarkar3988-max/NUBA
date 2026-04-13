# Design Pattern: Entity Component System
# Category: Game Patterns

print("=== Entity Component System Pattern ===")
print("Category: Game Patterns")
print()

# Entity Component System implementation in Nuba

class EntitycomponentsystemPattern {
    fun init(self) {
        self.name     = "Entity Component System"
        self.category = "game_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Entity Component System to:", context)
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
        print("\nDemonstration: Entity Component System")
        print("Intent: Solve common design problems using Entity Component System")
        print("Use when:")
        print("  1. You need entity component system behavior")
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

let pattern = new EntitycomponentsystemPattern()
pattern.demonstrate()
pattern.examples()
print("\nEntity Component System implementation complete!")
