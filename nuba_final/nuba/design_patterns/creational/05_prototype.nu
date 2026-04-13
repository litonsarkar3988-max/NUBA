# Design Pattern: Prototype
# Category: Creational

print("=== Prototype Pattern ===")
print("Category: Creational")
print()

# Prototype implementation in Nuba

class PrototypePattern {
    fun init(self) {
        self.name     = "Prototype"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Prototype to:", context)
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
        print("\nDemonstration: Prototype")
        print("Intent: Solve common design problems using Prototype")
        print("Use when:")
        print("  1. You need prototype behavior")
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

let pattern = new PrototypePattern()
pattern.demonstrate()
pattern.examples()
print("\nPrototype implementation complete!")
