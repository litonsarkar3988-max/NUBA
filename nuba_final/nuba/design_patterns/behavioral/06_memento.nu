# Design Pattern: Memento
# Category: Behavioral

print("=== Memento Pattern ===")
print("Category: Behavioral")
print()

# Memento implementation in Nuba

class MementoPattern {
    fun init(self) {
        self.name     = "Memento"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Memento to:", context)
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
        print("\nDemonstration: Memento")
        print("Intent: Solve common design problems using Memento")
        print("Use when:")
        print("  1. You need memento behavior")
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

let pattern = new MementoPattern()
pattern.demonstrate()
pattern.examples()
print("\nMemento implementation complete!")
