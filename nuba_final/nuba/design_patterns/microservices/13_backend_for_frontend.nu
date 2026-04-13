# Design Pattern: Backend For Frontend
# Category: Microservices

print("=== Backend For Frontend Pattern ===")
print("Category: Microservices")
print()

# Backend For Frontend implementation in Nuba

class BackendforfrontendPattern {
    fun init(self) {
        self.name     = "Backend For Frontend"
        self.category = "microservices"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Backend For Frontend to:", context)
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
        print("\nDemonstration: Backend For Frontend")
        print("Intent: Solve common design problems using Backend For Frontend")
        print("Use when:")
        print("  1. You need backend for frontend behavior")
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

let pattern = new BackendforfrontendPattern()
pattern.demonstrate()
pattern.examples()
print("\nBackend For Frontend implementation complete!")
