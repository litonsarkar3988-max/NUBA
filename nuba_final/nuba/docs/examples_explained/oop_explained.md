# Object-Oriented Programming Explained

## Classes
A class is a blueprint for objects.

```nuba
class Car {
    fun init(self, make, model) {
        self.make  = make   # instance field
        self.model = model
        self.speed = 0
    }
    fun accelerate(self, amount) {
        self.speed += amount
    }
}
let car = new Car("Toyota", "Camry")
car.accelerate(60)
print(car.speed)  # 60
```
