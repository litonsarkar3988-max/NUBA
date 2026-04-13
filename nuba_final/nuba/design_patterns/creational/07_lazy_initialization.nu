# Design Pattern: Lazy Initialization
# Category: Creational

print("=== Lazy Initialization Pattern ===")
print("Category: Creational")
print()

# Lazy Initialization implementation in Nuba

class LazyinitializationPattern {
    fun init(self) {
        self.name     = "Lazy Initialization"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Lazy Initialization to:", context)
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
        print("\nDemonstration: Lazy Initialization")
        print("Intent: Solve common design problems using Lazy Initialization")
        print("Use when:")
        print("  1. You need lazy initialization behavior")
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

let pattern = new LazyinitializationPattern()
pattern.demonstrate()
pattern.examples()
print("\nLazy Initialization implementation complete!")
