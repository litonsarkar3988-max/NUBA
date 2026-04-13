# Design Pattern: Shared Database
# Category: Microservices

print("=== Shared Database Pattern ===")
print("Category: Microservices")
print()

# Shared Database implementation in Nuba

class ShareddatabasePattern {
    fun init(self) {
        self.name     = "Shared Database"
        self.category = "microservices"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Shared Database to:", context)
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
        print("\nDemonstration: Shared Database")
        print("Intent: Solve common design problems using Shared Database")
        print("Use when:")
        print("  1. You need shared database behavior")
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

let pattern = new ShareddatabasePattern()
pattern.demonstrate()
pattern.examples()
print("\nShared Database implementation complete!")
