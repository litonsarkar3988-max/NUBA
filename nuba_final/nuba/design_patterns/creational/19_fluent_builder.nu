# Design Pattern: Fluent Builder
# Category: Creational

print("=== Fluent Builder Pattern ===")
print("Category: Creational")
print()

# Fluent Builder implementation in Nuba

class FluentbuilderPattern {
    fun init(self) {
        self.name     = "Fluent Builder"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Fluent Builder to:", context)
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
        print("\nDemonstration: Fluent Builder")
        print("Intent: Solve common design problems using Fluent Builder")
        print("Use when:")
        print("  1. You need fluent builder behavior")
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

let pattern = new FluentbuilderPattern()
pattern.demonstrate()
pattern.examples()
print("\nFluent Builder implementation complete!")
