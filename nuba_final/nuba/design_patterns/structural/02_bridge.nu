# Design Pattern: Bridge
# Category: Structural

print("=== Bridge Pattern ===")
print("Category: Structural")
print()

# Bridge implementation in Nuba

class BridgePattern {
    fun init(self) {
        self.name     = "Bridge"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Bridge to:", context)
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
        print("\nDemonstration: Bridge")
        print("Intent: Solve common design problems using Bridge")
        print("Use when:")
        print("  1. You need bridge behavior")
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

let pattern = new BridgePattern()
pattern.demonstrate()
pattern.examples()
print("\nBridge implementation complete!")
