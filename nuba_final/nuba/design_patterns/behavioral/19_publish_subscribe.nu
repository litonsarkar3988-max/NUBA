# Design Pattern: Publish Subscribe
# Category: Behavioral

print("=== Publish Subscribe Pattern ===")
print("Category: Behavioral")
print()

# Publish Subscribe implementation in Nuba

class PublishsubscribePattern {
    fun init(self) {
        self.name     = "Publish Subscribe"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Publish Subscribe to:", context)
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
        print("\nDemonstration: Publish Subscribe")
        print("Intent: Solve common design problems using Publish Subscribe")
        print("Use when:")
        print("  1. You need publish subscribe behavior")
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

let pattern = new PublishsubscribePattern()
pattern.demonstrate()
pattern.examples()
print("\nPublish Subscribe implementation complete!")
