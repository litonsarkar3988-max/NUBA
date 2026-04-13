# OOP Exercise 14: Proxy: lazy loading, caching
# Pattern: 14 Proxy Pattern

class Base14 {
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

class Extended14(Base14) {
    fun init(self, name, extra) {
        super.init(name)
        self.extra = extra
    }
    fun describe(self) {
        return super.describe() + " (extra: " + str(self.extra) + ")"
    }
}

# Demo: Proxy: lazy loading, caching
let obj1 = new Base14("14_proxy_pattern")
obj1.add("item_a").add("item_b").add("item_c")
obj1.process()
print(obj1.describe())

let obj2 = new Extended14("14_proxy_pattern_extended", 42)
obj2.add("x").add("y")
print(obj2.describe())
