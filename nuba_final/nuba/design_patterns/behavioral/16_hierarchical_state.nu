# Design Pattern: Hierarchical State
# Category: Behavioral

print("=== Hierarchical State Pattern ===")
print("Category: Behavioral")
print()

# Hierarchical State implementation in Nuba

class HierarchicalstatePattern {
    fun init(self) {
        self.name     = "Hierarchical State"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Hierarchical State to:", context)
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
        print("\nDemonstration: Hierarchical State")
        print("Intent: Solve common design problems using Hierarchical State")
        print("Use when:")
        print("  1. You need hierarchical state behavior")
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

let pattern = new HierarchicalstatePattern()
pattern.demonstrate()
pattern.examples()
print("\nHierarchical State implementation complete!")
