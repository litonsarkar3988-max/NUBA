# OOP Exercise 49: Visitor: operations on object tree
# Pattern: 49 Visitor Pattern

class Base49 {
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

class Extended49(Base49) {
    fun init(self, name, extra) {
        super.init(name)
        self.extra = extra
    }
    fun describe(self) {
        return super.describe() + " (extra: " + str(self.extra) + ")"
    }
}

# Demo: Visitor: operations on object tree
let obj1 = new Base49("49_visitor_pattern")
obj1.add("item_a").add("item_b").add("item_c")
obj1.process()
print(obj1.describe())

let obj2 = new Extended49("49_visitor_pattern_extended", 42)
obj2.add("x").add("y")
print(obj2.describe())
