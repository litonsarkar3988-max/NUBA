# Design Pattern: Decompose By Capability
# Category: Microservices

print("=== Decompose By Capability Pattern ===")
print("Category: Microservices")
print()

# Decompose By Capability implementation in Nuba

class DecomposebycapabilityPattern {
    fun init(self) {
        self.name     = "Decompose By Capability"
        self.category = "microservices"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Decompose By Capability to:", context)
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
        print("\nDemonstration: Decompose By Capability")
        print("Intent: Solve common design problems using Decompose By Capability")
        print("Use when:")
        print("  1. You need decompose by capability behavior")
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

let pattern = new DecomposebycapabilityPattern()
pattern.demonstrate()
pattern.examples()
print("\nDecompose By Capability implementation complete!")
