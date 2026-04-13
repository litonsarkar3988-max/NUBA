# Design Pattern: Pipes Filters
# Category: Structural

print("=== Pipes Filters Pattern ===")
print("Category: Structural")
print()

# Pipes Filters implementation in Nuba

class PipesfiltersPattern {
    fun init(self) {
        self.name     = "Pipes Filters"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Pipes Filters to:", context)
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
        print("\nDemonstration: Pipes Filters")
        print("Intent: Solve common design problems using Pipes Filters")
        print("Use when:")
        print("  1. You need pipes filters behavior")
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

let pattern = new PipesfiltersPattern()
pattern.demonstrate()
pattern.examples()
print("\nPipes Filters implementation complete!")
