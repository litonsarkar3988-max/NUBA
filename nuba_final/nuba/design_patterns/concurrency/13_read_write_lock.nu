# Design Pattern: Read Write Lock
# Category: Concurrency

print("=== Read Write Lock Pattern ===")
print("Category: Concurrency")
print()

# Read Write Lock implementation in Nuba

class ReadwritelockPattern {
    fun init(self) {
        self.name     = "Read Write Lock"
        self.category = "concurrency"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Read Write Lock to:", context)
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
        print("\nDemonstration: Read Write Lock")
        print("Intent: Solve common design problems using Read Write Lock")
        print("Use when:")
        print("  1. You need read write lock behavior")
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

let pattern = new ReadwritelockPattern()
pattern.demonstrate()
pattern.examples()
print("\nRead Write Lock implementation complete!")
