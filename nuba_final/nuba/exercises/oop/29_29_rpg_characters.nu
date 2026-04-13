# OOP Exercise 29: RPG: Warrior, Mage, Rogue
# Pattern: 29 Rpg Characters

class Base29 {
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

class Extended29(Base29) {
    fun init(self, name, extra) {
        super.init(name)
        self.extra = extra
    }
    fun describe(self) {
        return super.describe() + " (extra: " + str(self.extra) + ")"
    }
}

# Demo: RPG: Warrior, Mage, Rogue
let obj1 = new Base29("29_rpg_characters")
obj1.add("item_a").add("item_b").add("item_c")
obj1.process()
print(obj1.describe())

let obj2 = new Extended29("29_rpg_characters_extended", 42)
obj2.add("x").add("y")
print(obj2.describe())
