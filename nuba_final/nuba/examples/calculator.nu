# examples/calculator.nu - Calculator in Nuba

class Calculator {
    fun init(self) {
        self.result  = 0
        self.history = []
    }

    fun _record(self, op, val, res) {
        push(self.history, format("{0} {1} = {2}", op, val, res))
        self.result = res
        return self
    }

    fun add(self, n)  { return self._record("+" , n, self.result + n) }
    fun sub(self, n)  { return self._record("-" , n, self.result - n) }
    fun mul(self, n)  { return self._record("*" , n, self.result * n) }

    fun div(self, n) {
        if n == 0 { throw "Division by zero" }
        return self._record("/", n, self.result / n)
    }

    fun pow(self, n)  { return self._record("**", n, self.result ** n) }
    fun sqrt(self)    { return self._record("sqrt", "", sqrt(self.result)) }

    fun reset(self) {
        self.result = 0
        return self
    }

    fun show(self) {
        print("Result:", self.result)
        return self
    }

    fun show_history(self) {
        print("History:")
        for entry in self.history {
            print(" ", entry)
        }
        return self
    }
}

let calc = new Calculator()

# Chained operations
calc.add(10).mul(3).sub(5).show()
calc.div(5).show()
calc.pow(2).show()
calc.sqrt().show()

print()
calc.show_history()

# Fresh calculation
print()
let c2 = new Calculator()
c2.add(100).sub(25).mul(2).div(5).show()
