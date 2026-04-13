# examples/inheritance.nu - Deep inheritance and polymorphism in Nuba

class Vehicle {
    fun init(self, make, model, year) {
        self.make  = make
        self.model = model
        self.year  = year
        self.speed = 0
    }

    fun accelerate(self, amount) {
        self.speed += amount
        print(self.name() + " accelerates to " + str(self.speed) + " km/h")
    }

    fun brake(self, amount) {
        self.speed = max([0, self.speed - amount])
        print(self.name() + " slows to " + str(self.speed) + " km/h")
    }

    fun name(self) {
        return str(self.year) + " " + self.make + " " + self.model
    }

    fun describe(self) {
        print(self.name() + " | speed: " + str(self.speed))
    }

    fun fuel_type(self) { return "unknown" }
}

class Car(Vehicle) {
    fun init(self, make, model, year, doors) {
        super.init(make, model, year)
        self.doors = doors
    }

    fun fuel_type(self) { return "petrol" }

    fun describe(self) {
        super.describe()
        print("  Type: Car | Doors:", self.doors, "| Fuel:", self.fuel_type())
    }
}

class ElectricCar(Car) {
    fun init(self, make, model, year, doors, range_km) {
        super.init(make, model, year, doors)
        self.range_km = range_km
        self.battery  = 100
    }

    fun fuel_type(self) { return "electric" }

    fun charge(self, pct) {
        self.battery = min([100, self.battery + pct])
        print(self.name() + " charged to " + str(self.battery) + "%")
    }

    fun describe(self) {
        super.describe()
        print("  Range:", self.range_km, "km | Battery:", self.battery, "%")
    }
}

class Truck(Vehicle) {
    fun init(self, make, model, year, payload_tonnes) {
        super.init(make, model, year)
        self.payload = payload_tonnes
        self.cargo   = 0
    }

    fun load(self, tonnes) {
        if self.cargo + tonnes > self.payload {
            throw "Overloaded! Max payload: " + str(self.payload) + "t"
        }
        self.cargo += tonnes
        print(self.name() + " loaded " + str(tonnes) + "t (total: " + str(self.cargo) + "t)")
    }

    fun fuel_type(self) { return "diesel" }

    fun describe(self) {
        super.describe()
        print("  Type: Truck | Payload:", self.payload, "t | Cargo:", self.cargo, "t")
    }
}

# Polymorphic fleet
let fleet = [
    new Car("Toyota", "Camry", 2022, 4),
    new ElectricCar("Tesla", "Model 3", 2023, 4, 500),
    new Truck("Volvo", "FH16", 2021, 25),
    new Car("BMW", "M3", 2023, 2),
    new ElectricCar("Rivian", "R1T", 2023, 4, 480)
]

print("=== Fleet Overview ===")
for v in fleet {
    v.describe()
    print()
}

print("=== Fuel Types ===")
for v in fleet {
    print(v.name(), "->", v.fuel_type())
}

print("\n=== Race Simulation ===")
for v in fleet {
    v.accelerate(randint(40, 120))
}
let fastest = fleet[0]
for v in fleet {
    if v.speed > fastest.speed { fastest = v }
}
print("Fastest:", fastest.name(), "at", fastest.speed, "km/h")

print("\n=== Electric Vehicles ===")
for v in fleet {
    if isString(v.fuel_type()) and v.fuel_type() == "electric" {
        v.charge(20)
        v.describe()
        print()
    }
}

print("\n=== Loading Truck ===")
let truck = fleet[2]
try {
    truck.load(10)
    truck.load(8)
    truck.load(5)
    truck.load(5)   # This should fail
} catch (err) {
    print("Error:", err)
}
truck.describe()
