# Design Pattern: Subclass Sandbox
# Category: Game Patterns

print("=== Subclass Sandbox Pattern ===")
print("Category: Game Patterns")
print()

# Subclass Sandbox implementation in Nuba

class SubclasssandboxPattern {
    fun init(self) {
        self.name     = "Subclass Sandbox"
        self.category = "game_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Subclass Sandbox to:", context)
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
        print("\nDemonstration: Subclass Sandbox")
        print("Intent: Solve common design problems using Subclass Sandbox")
        print("Use when:")
        print("  1. You need subclass sandbox behavior")
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

let pattern = new SubclasssandboxPattern()
pattern.demonstrate()
pattern.examples()
print("\nSubclass Sandbox implementation complete!")
