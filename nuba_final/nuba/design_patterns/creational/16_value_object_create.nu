# Design Pattern: Value Object Create
# Category: Creational

print("=== Value Object Create Pattern ===")
print("Category: Creational")
print()

# Value Object Create implementation in Nuba

class ValueobjectcreatePattern {
    fun init(self) {
        self.name     = "Value Object Create"
        self.category = "creational"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Value Object Create to:", context)
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
        print("\nDemonstration: Value Object Create")
        print("Intent: Solve common design problems using Value Object Create")
        print("Use when:")
        print("  1. You need value object create behavior")
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

let pattern = new ValueobjectcreatePattern()
pattern.demonstrate()
pattern.examples()
print("\nValue Object Create implementation complete!")
