# Design Pattern: Proxy
# Category: Structural

print("=== Proxy Pattern ===")
print("Category: Structural")
print()

# Proxy implementation in Nuba

class ProxyPattern {
    fun init(self) {
        self.name     = "Proxy"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Proxy to:", context)
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
        print("\nDemonstration: Proxy")
        print("Intent: Solve common design problems using Proxy")
        print("Use when:")
        print("  1. You need proxy behavior")
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

let pattern = new ProxyPattern()
pattern.demonstrate()
pattern.examples()
print("\nProxy implementation complete!")
