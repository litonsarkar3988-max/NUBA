# Design Pattern: Join
# Category: Concurrency

print("=== Join Pattern ===")
print("Category: Concurrency")
print()

# Join implementation in Nuba

class JoinPattern {
    fun init(self) {
        self.name     = "Join"
        self.category = "concurrency"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Join to:", context)
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
        print("\nDemonstration: Join")
        print("Intent: Solve common design problems using Join")
        print("Use when:")
        print("  1. You need join behavior")
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

let pattern = new JoinPattern()
pattern.demonstrate()
pattern.examples()
print("\nJoin implementation complete!")
