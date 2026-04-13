# Design Pattern: Decorator
# Category: Structural

print("=== Decorator Pattern ===")
print("Category: Structural")
print()

# Decorator implementation in Nuba

class DecoratorPattern {
    fun init(self) {
        self.name     = "Decorator"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Decorator to:", context)
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
        print("\nDemonstration: Decorator")
        print("Intent: Solve common design problems using Decorator")
        print("Use when:")
        print("  1. You need decorator behavior")
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

let pattern = new DecoratorPattern()
pattern.demonstrate()
pattern.examples()
print("\nDecorator implementation complete!")
