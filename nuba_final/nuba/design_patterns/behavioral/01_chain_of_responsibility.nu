# Design Pattern: Chain Of Responsibility
# Category: Behavioral

print("=== Chain Of Responsibility Pattern ===")
print("Category: Behavioral")
print()

# Chain Of Responsibility implementation in Nuba

class ChainofresponsibilityPattern {
    fun init(self) {
        self.name     = "Chain Of Responsibility"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Chain Of Responsibility to:", context)
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
        print("\nDemonstration: Chain Of Responsibility")
        print("Intent: Solve common design problems using Chain Of Responsibility")
        print("Use when:")
        print("  1. You need chain of responsibility behavior")
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

let pattern = new ChainofresponsibilityPattern()
pattern.demonstrate()
pattern.examples()
print("\nChain Of Responsibility implementation complete!")
