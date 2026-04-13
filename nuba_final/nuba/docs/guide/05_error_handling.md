# Error Handling in Nuba

## Try / Catch / Finally

```nuba
try {
    let result = risky_operation()
    print("Success:", result)
} catch (err) {
    print("Error:", err)
} finally {
    print("Always runs")
}
```

## Throwing Errors

```nuba
fun divide(a, b) {
    if b == 0 { throw "Division by zero!" }
    return a / b
}

try {
    print(divide(10, 0))
} catch (err) {
    print("Caught:", err)
}
```

## Custom Error Classes

```nuba
class AppError {
    fun init(self, code, message) {
        self.code    = code
        self.message = message
    }
    fun describe(self) {
        return "[" + str(self.code) + "] " + self.message
    }
}

try {
    throw new AppError(404, "Not found")
} catch (err) {
    print(err.describe())
}
```

## Assert

```nuba
assert(x > 0, "x must be positive")
```
