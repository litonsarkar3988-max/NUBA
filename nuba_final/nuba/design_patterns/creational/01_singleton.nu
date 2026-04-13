# Design Pattern: Singleton
# Category: Creational

print("=== Singleton Pattern ===")
print("Category: Creational")
print()

# Singleton implementation in Nuba

class SingletonPattern {
    fun init(self) {
        self.name     = "Singleton"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Singleton to:", context)
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
        print("\nDemonstration: Singleton")
        print("Intent: Solve common design problems using Singleton")
        print("Use when:")
        print("  1. You need singleton behavior")
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

let pattern = new SingletonPattern()
pattern.demonstrate()
pattern.examples()
print("\nSingleton implementation complete!")
