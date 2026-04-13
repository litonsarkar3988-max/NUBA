# examples/classes.nu - Classes and OOP in Nuba

class Animal {
    fun init(self, name, sound) {
        self.name = name
        self.sound = sound
    }

    fun speak(self) {
        print(self.name + " says " + self.sound + "!")
    }

    fun describe(self) {
        return "I am " + self.name
    }
}

class Dog(Animal) {
    fun init(self, name) {
        super.init(name, "Woof")
        self.tricks = []
    }

    fun learn(self, trick) {
        push(self.tricks, trick)
        print(self.name + " learned: " + trick)
    }

    fun perform(self) {
        if len(self.tricks) == 0 {
            print(self.name + " knows no tricks yet")
            return
        }
        print(self.name + " performs:")
        for trick in self.tricks {
            print("  -", trick)
        }
    }
}

class Cat(Animal) {
    fun init(self, name, indoor) {
        super.init(name, "Meow")
        self.indoor = indoor
    }

    fun describe(self) {
        let kind = "indoor" if self.indoor else "outdoor"
        return self.name + " is an " + kind + " cat"
    }
}

# Create instances
let dog = new Dog("Rex")
dog.speak()
dog.learn("sit")
dog.learn("shake")
dog.learn("roll over")
dog.perform()

print()

let cat = new Cat("Whiskers", true)
cat.speak()
print(cat.describe())

print()

# Counter class
class Counter {
    fun init(self, start = 0, step = 1) {
        self.value = start
        self.step  = step
        self.history = []
    }

    fun increment(self) {
        self.value += self.step
        push(self.history, self.value)
        return self
    }

    fun decrement(self) {
        self.value -= self.step
        push(self.history, self.value)
        return self
    }

    fun reset(self) {
        self.value = 0
        return self
    }

    fun show(self) {
        print("Counter:", self.value)
        return self
    }
}

let c = new Counter(0, 5)
c.increment()
c.increment()
c.increment()
c.show()
print("History:", c.history)

# Stack class
class Stack {
    fun init(self) {
        self.data = []
    }

    fun push(self, item) {
        push(self.data, item)
    }

    fun pop(self) {
        if self.is_empty() {
            throw "Stack is empty"
        }
        return pop(self.data)
    }

    fun peek(self) {
        return self.data[len(self.data) - 1]
    }

    fun is_empty(self) {
        return len(self.data) == 0
    }

    fun size(self) {
        return len(self.data)
    }
}

let stack = new Stack()
stack.push(1)
stack.push(2)
stack.push(3)
print("Stack size:", stack.size())
print("Top:", stack.peek())
print("Popped:", stack.pop())
print("Popped:", stack.pop())
print("Stack size now:", stack.size())
