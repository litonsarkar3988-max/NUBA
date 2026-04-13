# OOP Exercise 25: Vending machine state machine
# Pattern: 25 Vending Machine

class Base25 {
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

class Extended25(Base25) {
    fun init(self, name, extra) {
        super.init(name)
        self.extra = extra
    }
    fun describe(self) {
        return super.describe() + " (extra: " + str(self.extra) + ")"
    }
}

# Demo: Vending machine state machine
let obj1 = new Base25("25_vending_machine")
obj1.add("item_a").add("item_b").add("item_c")
obj1.process()
print(obj1.describe())

let obj2 = new Extended25("25_vending_machine_extended", 42)
obj2.add("x").add("y")
print(obj2.describe())
