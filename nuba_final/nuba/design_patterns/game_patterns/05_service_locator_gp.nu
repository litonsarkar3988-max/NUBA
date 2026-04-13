# Design Pattern: Service Locator Gp
# Category: Game Patterns

print("=== Service Locator Gp Pattern ===")
print("Category: Game Patterns")
print()

# Service Locator Gp implementation in Nuba

class ServicelocatorgpPattern {
    fun init(self) {
        self.name     = "Service Locator Gp"
        self.category = "game_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Service Locator Gp to:", context)
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
        print("\nDemonstration: Service Locator Gp")
        print("Intent: Solve common design problems using Service Locator Gp")
        print("Use when:")
        print("  1. You need service locator gp behavior")
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

let pattern = new ServicelocatorgpPattern()
pattern.demonstrate()
pattern.examples()
print("\nService Locator Gp implementation complete!")
