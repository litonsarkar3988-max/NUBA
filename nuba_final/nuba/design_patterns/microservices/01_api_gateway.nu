# Design Pattern: Api Gateway
# Category: Microservices

print("=== Api Gateway Pattern ===")
print("Category: Microservices")
print()

# Api Gateway implementation in Nuba

class ApigatewayPattern {
    fun init(self) {
        self.name     = "Api Gateway"
        self.category = "microservices"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Api Gateway to:", context)
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
        print("\nDemonstration: Api Gateway")
        print("Intent: Solve common design problems using Api Gateway")
        print("Use when:")
        print("  1. You need api gateway behavior")
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

let pattern = new ApigatewayPattern()
pattern.demonstrate()
pattern.examples()
print("\nApi Gateway implementation complete!")
