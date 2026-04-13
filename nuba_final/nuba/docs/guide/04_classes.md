# Classes and OOP in Nuba

## Basic Class

```nuba
class Dog {
    fun init(self, name, breed) {
        self.name  = name
        self.breed = breed
        self.tricks = []
    }

    fun learn(self, trick) {
        push(self.tricks, trick)
    }

    fun perform(self) {
        for trick in self.tricks {
            print(self.name, "does:", trick)
        }
    }
}

let rex = new Dog("Rex", "Labrador")
rex.learn("sit")
rex.learn("shake")
rex.perform()
```

## Inheritance

```nuba
class Animal {
    fun init(self, name) { self.name = name }
    fun speak(self) { print(self.name, "makes a sound") }
}

class Cat(Animal) {
    fun init(self, name) {
        super.init(name)
        self.indoor = true
    }
    fun speak(self) { print(self.name, "says Meow!") }
}

let cat = new Cat("Whiskers")
cat.speak()
```

## Polymorphism

```nuba
let animals = [new Dog("Rex","Lab"), new Cat("Kitty")]
for a in animals { a.speak() }
```
