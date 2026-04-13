# Design Pattern: Dependency Injection
# Category: Creational

print("=== Dependency Injection Pattern ===")
print("Category: Creational")
print()

# Dependency Injection implementation in Nuba

class DependencyinjectionPattern {
    fun init(self) {
        self.name     = "Dependency Injection"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Dependency Injection to:", context)
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
        print("\nDemonstration: Dependency Injection")
        print("Intent: Solve common design problems using Dependency Injection")
        print("Use when:")
        print("  1. You need dependency injection behavior")
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

let pattern = new DependencyinjectionPattern()
pattern.demonstrate()
pattern.examples()
print("\nDependency Injection implementation complete!")
