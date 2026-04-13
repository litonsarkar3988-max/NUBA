# Design Pattern: Registry
# Category: Creational

print("=== Registry Pattern ===")
print("Category: Creational")
print()

# Registry implementation in Nuba

class RegistryPattern {
    fun init(self) {
        self.name     = "Registry"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Registry to:", context)
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
        print("\nDemonstration: Registry")
        print("Intent: Solve common design problems using Registry")
        print("Use when:")
        print("  1. You need registry behavior")
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

let pattern = new RegistryPattern()
pattern.demonstrate()
pattern.examples()
print("\nRegistry implementation complete!")
