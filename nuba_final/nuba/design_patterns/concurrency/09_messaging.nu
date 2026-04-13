# Design Pattern: Messaging
# Category: Concurrency

print("=== Messaging Pattern ===")
print("Category: Concurrency")
print()

# Messaging implementation in Nuba

class MessagingPattern {
    fun init(self) {
        self.name     = "Messaging"
        self.category = "concurrency"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Messaging to:", context)
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
        print("\nDemonstration: Messaging")
        print("Intent: Solve common design problems using Messaging")
        print("Use when:")
        print("  1. You need messaging behavior")
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

let pattern = new MessagingPattern()
pattern.demonstrate()
pattern.examples()
print("\nMessaging implementation complete!")
