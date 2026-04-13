# Design Pattern: Step Builder
# Category: Creational

print("=== Step Builder Pattern ===")
print("Category: Creational")
print()

# Step Builder implementation in Nuba

class StepbuilderPattern {
    fun init(self) {
        self.name     = "Step Builder"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Step Builder to:", context)
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
        print("\nDemonstration: Step Builder")
        print("Intent: Solve common design problems using Step Builder")
        print("Use when:")
        print("  1. You need step builder behavior")
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

let pattern = new StepbuilderPattern()
pattern.demonstrate()
pattern.examples()
print("\nStep Builder implementation complete!")
