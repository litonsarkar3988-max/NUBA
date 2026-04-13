# Design Pattern: Competing Consumers
# Category: Cloud Patterns

print("=== Competing Consumers Pattern ===")
print("Category: Cloud Patterns")
print()

# Competing Consumers implementation in Nuba

class CompetingconsumersPattern {
    fun init(self) {
        self.name     = "Competing Consumers"
        self.category = "cloud_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Competing Consumers to:", context)
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
        print("\nDemonstration: Competing Consumers")
        print("Intent: Solve common design problems using Competing Consumers")
        print("Use when:")
        print("  1. You need competing consumers behavior")
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

let pattern = new CompetingconsumersPattern()
pattern.demonstrate()
pattern.examples()
print("\nCompeting Consumers implementation complete!")
