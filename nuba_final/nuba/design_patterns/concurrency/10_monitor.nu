# Design Pattern: Monitor
# Category: Concurrency

print("=== Monitor Pattern ===")
print("Category: Concurrency")
print()

# Monitor implementation in Nuba

class MonitorPattern {
    fun init(self) {
        self.name     = "Monitor"
        self.category = "concurrency"
        self.instances = []
        self.config   = {"version":"1.0","enabled":true}
    }

    fun apply(self, context) {
        print("Applying Monitor to:", context)
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
        print("\nDemonstration: Monitor")
        print("Intent: Solve common design problems using Monitor")
        print("Use when:")
        print("  1. You need monitor behavior")
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

let pattern = new MonitorPattern()
pattern.demonstrate()
pattern.examples()
print("\nMonitor implementation complete!")
