# Design Pattern: Hexagonal
# Category: Architectural

print("=== Hexagonal Pattern ===")
print("Category: Architectural")
print()

# Hexagonal implementation in Nuba

class HexagonalPattern {
    fun init(self) {
        self.name     = "Hexagonal"
        self.category = "architectural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Hexagonal to:", context)
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
        print("\nDemonstration: Hexagonal")
        print("Intent: Solve common design problems using Hexagonal")
        print("Use when:")
        print("  1. You need hexagonal behavior")
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

let pattern = new HexagonalPattern()
pattern.demonstrate()
pattern.examples()
print("\nHexagonal implementation complete!")
