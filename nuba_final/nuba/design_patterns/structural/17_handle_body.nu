# Design Pattern: Handle Body
# Category: Structural

print("=== Handle Body Pattern ===")
print("Category: Structural")
print()

# Handle Body implementation in Nuba

class HandlebodyPattern {
    fun init(self) {
        self.name     = "Handle Body"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Handle Body to:", context)
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
        print("\nDemonstration: Handle Body")
        print("Intent: Solve common design problems using Handle Body")
        print("Use when:")
        print("  1. You need handle body behavior")
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

let pattern = new HandlebodyPattern()
pattern.demonstrate()
pattern.examples()
print("\nHandle Body implementation complete!")
