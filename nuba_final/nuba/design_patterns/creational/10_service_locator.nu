# Design Pattern: Service Locator
# Category: Creational

print("=== Service Locator Pattern ===")
print("Category: Creational")
print()

# Service Locator implementation in Nuba

class ServicelocatorPattern {
    fun init(self) {
        self.name     = "Service Locator"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Service Locator to:", context)
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
        print("\nDemonstration: Service Locator")
        print("Intent: Solve common design problems using Service Locator")
        print("Use when:")
        print("  1. You need service locator behavior")
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

let pattern = new ServicelocatorPattern()
pattern.demonstrate()
pattern.examples()
print("\nService Locator implementation complete!")
