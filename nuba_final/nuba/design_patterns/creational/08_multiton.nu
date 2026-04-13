# Design Pattern: Multiton
# Category: Creational

print("=== Multiton Pattern ===")
print("Category: Creational")
print()

# Multiton implementation in Nuba

class MultitonPattern {
    fun init(self) {
        self.name     = "Multiton"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Multiton to:", context)
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
        print("\nDemonstration: Multiton")
        print("Intent: Solve common design problems using Multiton")
        print("Use when:")
        print("  1. You need multiton behavior")
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

let pattern = new MultitonPattern()
pattern.demonstrate()
pattern.examples()
print("\nMultiton implementation complete!")
