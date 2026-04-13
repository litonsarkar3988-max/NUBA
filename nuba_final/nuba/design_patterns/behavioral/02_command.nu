# Design Pattern: Command
# Category: Behavioral

print("=== Command Pattern ===")
print("Category: Behavioral")
print()

# Command implementation in Nuba

class CommandPattern {
    fun init(self) {
        self.name     = "Command"
        self.category = "behavioral"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Command to:", context)
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
        print("\nDemonstration: Command")
        print("Intent: Solve common design problems using Command")
        print("Use when:")
        print("  1. You need command behavior")
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

let pattern = new CommandPattern()
pattern.demonstrate()
pattern.examples()
print("\nCommand implementation complete!")
