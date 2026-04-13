# Design Pattern: Dynamic Linkage
# Category: Structural

print("=== Dynamic Linkage Pattern ===")
print("Category: Structural")
print()

# Dynamic Linkage implementation in Nuba

class DynamiclinkagePattern {
    fun init(self) {
        self.name     = "Dynamic Linkage"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Dynamic Linkage to:", context)
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
        print("\nDemonstration: Dynamic Linkage")
        print("Intent: Solve common design problems using Dynamic Linkage")
        print("Use when:")
        print("  1. You need dynamic linkage behavior")
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

let pattern = new DynamiclinkagePattern()
pattern.demonstrate()
pattern.examples()
print("\nDynamic Linkage implementation complete!")
