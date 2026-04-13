# Design Pattern: Role Object
# Category: Structural

print("=== Role Object Pattern ===")
print("Category: Structural")
print()

# Role Object implementation in Nuba

class RoleobjectPattern {
    fun init(self) {
        self.name     = "Role Object"
        self.category = "structural"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Role Object to:", context)
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
        print("\nDemonstration: Role Object")
        print("Intent: Solve common design problems using Role Object")
        print("Use when:")
        print("  1. You need role object behavior")
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

let pattern = new RoleobjectPattern()
pattern.demonstrate()
pattern.examples()
print("\nRole Object implementation complete!")
