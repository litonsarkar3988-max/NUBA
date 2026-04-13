# Design Pattern: Decompose By Subdomain
# Category: Microservices

print("=== Decompose By Subdomain Pattern ===")
print("Category: Microservices")
print()

# Decompose By Subdomain implementation in Nuba

class DecomposebysubdomainPattern {
    fun init(self) {
        self.name     = "Decompose By Subdomain"
        self.category = "microservices"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Decompose By Subdomain to:", context)
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
        print("\nDemonstration: Decompose By Subdomain")
        print("Intent: Solve common design problems using Decompose By Subdomain")
        print("Use when:")
        print("  1. You need decompose by subdomain behavior")
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

let pattern = new DecomposebysubdomainPattern()
pattern.demonstrate()
pattern.examples()
print("\nDecompose By Subdomain implementation complete!")
