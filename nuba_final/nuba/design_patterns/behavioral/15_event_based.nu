# Design Pattern: Event Based
# Category: Behavioral

print("=== Event Based Pattern ===")
print("Category: Behavioral")
print()

# Event Based implementation in Nuba

class EventbasedPattern {
    fun init(self) {
        self.name     = "Event Based"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Event Based to:", context)
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
        print("\nDemonstration: Event Based")
        print("Intent: Solve common design problems using Event Based")
        print("Use when:")
        print("  1. You need event based behavior")
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

let pattern = new EventbasedPattern()
pattern.demonstrate()
pattern.examples()
print("\nEvent Based implementation complete!")
