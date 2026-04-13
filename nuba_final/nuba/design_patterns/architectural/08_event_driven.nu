# Design Pattern: Event Driven
# Category: Architectural

print("=== Event Driven Pattern ===")
print("Category: Architectural")
print()

# Event Driven implementation in Nuba

class EventdrivenPattern {
    fun init(self) {
        self.name     = "Event Driven"
        self.category = "architectural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Event Driven to:", context)
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
        print("\nDemonstration: Event Driven")
        print("Intent: Solve common design problems using Event Driven")
        print("Use when:")
        print("  1. You need event driven behavior")
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

let pattern = new EventdrivenPattern()
pattern.demonstrate()
pattern.examples()
print("\nEvent Driven implementation complete!")
