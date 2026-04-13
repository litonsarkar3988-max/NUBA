# Design Pattern: Reactive Extensions
# Category: Behavioral

print("=== Reactive Extensions Pattern ===")
print("Category: Behavioral")
print()

# Reactive Extensions implementation in Nuba

class ReactiveextensionsPattern {
    fun init(self) {
        self.name     = "Reactive Extensions"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Reactive Extensions to:", context)
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
        print("\nDemonstration: Reactive Extensions")
        print("Intent: Solve common design problems using Reactive Extensions")
        print("Use when:")
        print("  1. You need reactive extensions behavior")
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

let pattern = new ReactiveextensionsPattern()
pattern.demonstrate()
pattern.examples()
print("\nReactive Extensions implementation complete!")
