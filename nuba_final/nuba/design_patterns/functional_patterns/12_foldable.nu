# Design Pattern: Foldable
# Category: Functional Patterns

print("=== Foldable Pattern ===")
print("Category: Functional Patterns")
print()

# Foldable implementation in Nuba

class FoldablePattern {
    fun init(self) {
        self.name     = "Foldable"
        self.category = "functional_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Foldable to:", context)
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
        print("\nDemonstration: Foldable")
        print("Intent: Solve common design problems using Foldable")
        print("Use when:")
        print("  1. You need foldable behavior")
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

let pattern = new FoldablePattern()
pattern.demonstrate()
pattern.examples()
print("\nFoldable implementation complete!")
