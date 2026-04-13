# Design Pattern: Interceptor
# Category: Enterprise

print("=== Interceptor Pattern ===")
print("Category: Enterprise")
print()

# Interceptor implementation in Nuba

class InterceptorPattern {
    fun init(self) {
        self.name     = "Interceptor"
        self.category = "enterprise"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Interceptor to:", context)
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
        print("\nDemonstration: Interceptor")
        print("Intent: Solve common design problems using Interceptor")
        print("Use when:")
        print("  1. You need interceptor behavior")
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

let pattern = new InterceptorPattern()
pattern.demonstrate()
pattern.examples()
print("\nInterceptor implementation complete!")
