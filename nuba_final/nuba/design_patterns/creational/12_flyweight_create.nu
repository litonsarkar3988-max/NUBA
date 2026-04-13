# Design Pattern: Flyweight Create
# Category: Creational

print("=== Flyweight Create Pattern ===")
print("Category: Creational")
print()

# Flyweight Create implementation in Nuba

class FlyweightcreatePattern {
    fun init(self) {
        self.name     = "Flyweight Create"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Flyweight Create to:", context)
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
        print("\nDemonstration: Flyweight Create")
        print("Intent: Solve common design problems using Flyweight Create")
        print("Use when:")
        print("  1. You need flyweight create behavior")
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

let pattern = new FlyweightcreatePattern()
pattern.demonstrate()
pattern.examples()
print("\nFlyweight Create implementation complete!")
