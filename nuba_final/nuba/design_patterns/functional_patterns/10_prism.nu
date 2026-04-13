# Design Pattern: Prism
# Category: Functional Patterns

print("=== Prism Pattern ===")
print("Category: Functional Patterns")
print()

# Prism implementation in Nuba

class PrismPattern {
    fun init(self) {
        self.name     = "Prism"
        self.category = "functional_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Prism to:", context)
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
        print("\nDemonstration: Prism")
        print("Intent: Solve common design problems using Prism")
        print("Use when:")
        print("  1. You need prism behavior")
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

let pattern = new PrismPattern()
pattern.demonstrate()
pattern.examples()
print("\nPrism implementation complete!")
