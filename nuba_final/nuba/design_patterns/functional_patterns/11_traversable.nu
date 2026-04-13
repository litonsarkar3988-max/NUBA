# Design Pattern: Traversable
# Category: Functional Patterns

print("=== Traversable Pattern ===")
print("Category: Functional Patterns")
print()

# Traversable implementation in Nuba

class TraversablePattern {
    fun init(self) {
        self.name     = "Traversable"
        self.category = "functional_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Traversable to:", context)
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
        print("\nDemonstration: Traversable")
        print("Intent: Solve common design problems using Traversable")
        print("Use when:")
        print("  1. You need traversable behavior")
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

let pattern = new TraversablePattern()
pattern.demonstrate()
pattern.examples()
print("\nTraversable implementation complete!")
