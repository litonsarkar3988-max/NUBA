# Design Pattern: Outbox
# Category: Architectural

print("=== Outbox Pattern ===")
print("Category: Architectural")
print()

# Outbox implementation in Nuba

class OutboxPattern {
    fun init(self) {
        self.name     = "Outbox"
        self.category = "architectural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Outbox to:", context)
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
        print("\nDemonstration: Outbox")
        print("Intent: Solve common design problems using Outbox")
        print("Use when:")
        print("  1. You need outbox behavior")
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

let pattern = new OutboxPattern()
pattern.demonstrate()
pattern.examples()
print("\nOutbox implementation complete!")
