# Design Pattern: Event Sourcing
# Category: Architectural

print("=== Event Sourcing Pattern ===")
print("Category: Architectural")
print()

# Event Sourcing implementation in Nuba

class EventsourcingPattern {
    fun init(self) {
        self.name     = "Event Sourcing"
        self.category = "architectural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Event Sourcing to:", context)
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
        print("\nDemonstration: Event Sourcing")
        print("Intent: Solve common design problems using Event Sourcing")
        print("Use when:")
        print("  1. You need event sourcing behavior")
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

let pattern = new EventsourcingPattern()
pattern.demonstrate()
pattern.examples()
print("\nEvent Sourcing implementation complete!")
