# Design Pattern: Fallback
# Category: Architectural

print("=== Fallback Pattern ===")
print("Category: Architectural")
print()

# Fallback implementation in Nuba

class FallbackPattern {
    fun init(self) {
        self.name     = "Fallback"
        self.category = "architectural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Fallback to:", context)
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
        print("\nDemonstration: Fallback")
        print("Intent: Solve common design problems using Fallback")
        print("Use when:")
        print("  1. You need fallback behavior")
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

let pattern = new FallbackPattern()
pattern.demonstrate()
pattern.examples()
print("\nFallback implementation complete!")
