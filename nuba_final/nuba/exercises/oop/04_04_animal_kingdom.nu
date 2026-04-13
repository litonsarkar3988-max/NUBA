# OOP Exercise 04: Animal kingdom: Mammal, Bird, Fish
# Pattern: 04 Animal Kingdom

class Base4 {
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

class Extended4(Base4) {
    fun init(self, name, extra) {
        super.init(name)
        self.extra = extra
    }
    fun describe(self) {
        return super.describe() + " (extra: " + str(self.extra) + ")"
    }
}

# Demo: Animal kingdom: Mammal, Bird, Fish
let obj1 = new Base4("04_animal_kingdom")
obj1.add("item_a").add("item_b").add("item_c")
obj1.process()
print(obj1.describe())

let obj2 = new Extended4("04_animal_kingdom_extended", 42)
obj2.add("x").add("y")
print(obj2.describe())
