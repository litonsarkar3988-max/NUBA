# Design Pattern: Twin
# Category: Structural

print("=== Twin Pattern ===")
print("Category: Structural")
print()

# Twin implementation in Nuba

class TwinPattern {
    fun init(self) {
        self.name     = "Twin"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Twin to:", context)
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
        print("\nDemonstration: Twin")
        print("Intent: Solve common design problems using Twin")
        print("Use when:")
        print("  1. You need twin behavior")
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

let pattern = new TwinPattern()
pattern.demonstrate()
pattern.examples()
print("\nTwin implementation complete!")
