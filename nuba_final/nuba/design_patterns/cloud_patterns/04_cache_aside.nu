# Design Pattern: Cache Aside
# Category: Cloud Patterns

print("=== Cache Aside Pattern ===")
print("Category: Cloud Patterns")
print()

# Cache Aside implementation in Nuba

class CacheasidePattern {
    fun init(self) {
        self.name     = "Cache Aside"
        self.category = "cloud_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Cache Aside to:", context)
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
        print("\nDemonstration: Cache Aside")
        print("Intent: Solve common design problems using Cache Aside")
        print("Use when:")
        print("  1. You need cache aside behavior")
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

let pattern = new CacheasidePattern()
pattern.demonstrate()
pattern.examples()
print("\nCache Aside implementation complete!")
