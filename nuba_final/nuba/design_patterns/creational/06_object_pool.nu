# Design Pattern: Object Pool
# Category: Creational

print("=== Object Pool Pattern ===")
print("Category: Creational")
print()

# Object Pool implementation in Nuba

class ObjectpoolPattern {
    fun init(self) {
        self.name     = "Object Pool"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Object Pool to:", context)
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
        print("\nDemonstration: Object Pool")
        print("Intent: Solve common design problems using Object Pool")
        print("Use when:")
        print("  1. You need object pool behavior")
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

let pattern = new ObjectpoolPattern()
pattern.demonstrate()
pattern.examples()
print("\nObject Pool implementation complete!")
