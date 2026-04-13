# Design Pattern: Index Table
# Category: Cloud Patterns

print("=== Index Table Pattern ===")
print("Category: Cloud Patterns")
print()

# Index Table implementation in Nuba

class IndextablePattern {
    fun init(self) {
        self.name     = "Index Table"
        self.category = "cloud_patterns"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Index Table to:", context)
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
        print("\nDemonstration: Index Table")
        print("Intent: Solve common design problems using Index Table")
        print("Use when:")
        print("  1. You need index table behavior")
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

let pattern = new IndextablePattern()
pattern.demonstrate()
pattern.examples()
print("\nIndex Table implementation complete!")
