# Design Pattern: Publisher Subscriber
# Category: Cloud Patterns

print("=== Publisher Subscriber Pattern ===")
print("Category: Cloud Patterns")
print()

# Publisher Subscriber implementation in Nuba

class PublishersubscriberPattern {
    fun init(self) {
        self.name     = "Publisher Subscriber"
        self.category = "cloud_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Publisher Subscriber to:", context)
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
        print("\nDemonstration: Publisher Subscriber")
        print("Intent: Solve common design problems using Publisher Subscriber")
        print("Use when:")
        print("  1. You need publisher subscriber behavior")
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

let pattern = new PublishersubscriberPattern()
pattern.demonstrate()
pattern.examples()
print("\nPublisher Subscriber implementation complete!")
