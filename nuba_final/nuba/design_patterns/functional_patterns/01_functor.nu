# Design Pattern: Functor
# Category: Functional Patterns

print("=== Functor Pattern ===")
print("Category: Functional Patterns")
print()

# Functor implementation in Nuba

class FunctorPattern {
    fun init(self) {
        self.name     = "Functor"
        self.category = "functional_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Functor to:", context)
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
        print("\nDemonstration: Functor")
        print("Intent: Solve common design problems using Functor")
        print("Use when:")
        print("  1. You need functor behavior")
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

let pattern = new FunctorPattern()
pattern.demonstrate()
pattern.examples()
print("\nFunctor implementation complete!")
