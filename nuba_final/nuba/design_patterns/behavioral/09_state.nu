# Design Pattern: State
# Category: Behavioral

print("=== State Pattern ===")
print("Category: Behavioral")
print()

# State implementation in Nuba

class StatePattern {
    fun init(self) {
        self.name     = "State"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying State to:", context)
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
        print("\nDemonstration: State")
        print("Intent: Solve common design problems using State")
        print("Use when:")
        print("  1. You need state behavior")
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

let pattern = new StatePattern()
pattern.demonstrate()
pattern.examples()
print("\nState implementation complete!")
