# Design Pattern: Factory Kit
# Category: Creational

print("=== Factory Kit Pattern ===")
print("Category: Creational")
print()

# Factory Kit implementation in Nuba

class FactorykitPattern {
    fun init(self) {
        self.name     = "Factory Kit"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Factory Kit to:", context)
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
        print("\nDemonstration: Factory Kit")
        print("Intent: Solve common design problems using Factory Kit")
        print("Use when:")
        print("  1. You need factory kit behavior")
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

let pattern = new FactorykitPattern()
pattern.demonstrate()
pattern.examples()
print("\nFactory Kit implementation complete!")
