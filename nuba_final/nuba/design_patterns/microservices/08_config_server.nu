# Design Pattern: Config Server
# Category: Microservices

print("=== Config Server Pattern ===")
print("Category: Microservices")
print()

# Config Server implementation in Nuba

class ConfigserverPattern {
    fun init(self) {
        self.name     = "Config Server"
        self.category = "microservices"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Config Server to:", context)
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
        print("\nDemonstration: Config Server")
        print("Intent: Solve common design problems using Config Server")
        print("Use when:")
        print("  1. You need config server behavior")
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

let pattern = new ConfigserverPattern()
pattern.demonstrate()
pattern.examples()
print("\nConfig Server implementation complete!")
