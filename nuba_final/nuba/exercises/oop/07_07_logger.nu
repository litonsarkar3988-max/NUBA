# OOP Exercise 07: Logger with levels: DEBUG, INFO, WARN, ERROR
# Pattern: 07 Logger

class Base7 {
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

class Extended7(Base7) {
    fun init(self, name, extra) {
        super.init(name)
        self.extra = extra
    }
    fun describe(self) {
        return super.describe() + " (extra: " + str(self.extra) + ")"
    }
}

# Demo: Logger with levels: DEBUG, INFO, WARN, ERROR
let obj1 = new Base7("07_logger")
obj1.add("item_a").add("item_b").add("item_c")
obj1.process()
print(obj1.describe())

let obj2 = new Extended7("07_logger_extended", 42)
obj2.add("x").add("y")
print(obj2.describe())
