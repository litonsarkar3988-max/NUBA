# Design Pattern: Abstract Factory
# Category: Creational

print("=== Abstract Factory Pattern ===")
print("Category: Creational")
print()

# Abstract Factory implementation in Nuba

class AbstractfactoryPattern {
    fun init(self) {
        self.name     = "Abstract Factory"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Abstract Factory to:", context)
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
        print("\nDemonstration: Abstract Factory")
        print("Intent: Solve common design problems using Abstract Factory")
        print("Use when:")
        print("  1. You need abstract factory behavior")
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

let pattern = new AbstractfactoryPattern()
pattern.demonstrate()
pattern.examples()
print("\nAbstract Factory implementation complete!")
