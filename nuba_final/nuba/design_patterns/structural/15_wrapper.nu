# Design Pattern: Wrapper
# Category: Structural

print("=== Wrapper Pattern ===")
print("Category: Structural")
print()

# Wrapper implementation in Nuba

class WrapperPattern {
    fun init(self) {
        self.name     = "Wrapper"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Wrapper to:", context)
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
        print("\nDemonstration: Wrapper")
        print("Intent: Solve common design problems using Wrapper")
        print("Use when:")
        print("  1. You need wrapper behavior")
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

let pattern = new WrapperPattern()
pattern.demonstrate()
pattern.examples()
print("\nWrapper implementation complete!")
