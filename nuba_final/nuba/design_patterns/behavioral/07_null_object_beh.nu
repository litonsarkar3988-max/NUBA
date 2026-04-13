# Design Pattern: Null Object Beh
# Category: Behavioral

print("=== Null Object Beh Pattern ===")
print("Category: Behavioral")
print()

# Null Object Beh implementation in Nuba

class NullobjectbehPattern {
    fun init(self) {
        self.name     = "Null Object Beh"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Null Object Beh to:", context)
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
        print("\nDemonstration: Null Object Beh")
        print("Intent: Solve common design problems using Null Object Beh")
        print("Use when:")
        print("  1. You need null object beh behavior")
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

let pattern = new NullobjectbehPattern()
pattern.demonstrate()
pattern.examples()
print("\nNull Object Beh implementation complete!")
