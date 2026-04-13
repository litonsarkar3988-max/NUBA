# Design Pattern: Template Method
# Category: Behavioral

print("=== Template Method Pattern ===")
print("Category: Behavioral")
print()

# Template Method implementation in Nuba

class TemplatemethodPattern {
    fun init(self) {
        self.name     = "Template Method"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Template Method to:", context)
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
        print("\nDemonstration: Template Method")
        print("Intent: Solve common design problems using Template Method")
        print("Use when:")
        print("  1. You need template method behavior")
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

let pattern = new TemplatemethodPattern()
pattern.demonstrate()
pattern.examples()
print("\nTemplate Method implementation complete!")
