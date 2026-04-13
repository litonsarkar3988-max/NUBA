# OOP Exercise 42: Dependency injection container
# Pattern: 42 Dependency Injection

class Base42 {
    fun init(self, name) {
        self.name = name
        self.data = []
    }
    fun add(self, item) {
        push(self.data, item)
        return self
    }
    fun process(self) {
        print("Processing:", self.name)
        for item in self.data {
            print(" -", item)
        }
        return self
    }
    fun describe(self) {
        return self.name + " with " + str(len(self.data)) + " items"
    }
}

class Extended42(Base42) {
    fun init(self, name, extra) {
        super.init(name)
        self.extra = extra
    }
    fun describe(self) {
        return super.describe() + " (extra: " + str(self.extra) + ")"
    }
}

# Demo: Dependency injection container
let obj1 = new Base42("42_dependency_injection")
obj1.add("item_a").add("item_b").add("item_c")
obj1.process()
print(obj1.describe())

let obj2 = new Extended42("42_dependency_injection_extended", 42)
obj2.add("x").add("y")
print(obj2.describe())
