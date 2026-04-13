# Design Pattern: Delegation
# Category: Structural

print("=== Delegation Pattern ===")
print("Category: Structural")
print()

# Delegation implementation in Nuba

class DelegationPattern {
    fun init(self) {
        self.name     = "Delegation"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Delegation to:", context)
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
        print("\nDemonstration: Delegation")
        print("Intent: Solve common design problems using Delegation")
        print("Use when:")
        print("  1. You need delegation behavior")
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

let pattern = new DelegationPattern()
pattern.demonstrate()
pattern.examples()
print("\nDelegation implementation complete!")
