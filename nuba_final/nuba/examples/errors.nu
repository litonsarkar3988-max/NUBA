# examples/errors.nu - Error handling in Nuba

# Basic try/catch
try {
    let x = 10 / 0
    print("Should not reach here")
} catch (err) {
    print("Caught error:", err)
}

# Throw and catch
fun divide(a, b) {
    if b == 0 {
        throw "Division by zero!"
    }
    return a / b
}

try {
    print(divide(10, 2))
    print(divide(5, 0))
} catch (err) {
    print("Error:", err)
}

# Try/catch/finally
fun risky_operation() {
    throw "Something went wrong"
}

try {
    risky_operation()
} catch (err) {
    print("Handled:", err)
} finally {
    print("Cleanup always runs")
}

# Custom error objects
class AppError {
    fun init(self, code, message) {
        self.code    = code
        self.message = message
    }

    fun describe(self) {
        return "[Error " + str(self.code) + "] " + self.message
    }
}

fun fetch_user(id) {
    if id <= 0 {
        throw new AppError(400, "Invalid user ID")
    }
    if id > 1000 {
        throw new AppError(404, "User not found")
    }
    return {"id": id, "name": "User" + str(id)}
}

fun safe_fetch(id) {
    try {
        let user = fetch_user(id)
        print("Found:", user["name"])
    } catch (err) {
        if isString(err) {
            print("String error:", err)
        } else {
            print(err.describe())
        }
    }
}

safe_fetch(42)
safe_fetch(-1)
safe_fetch(9999)

# Assert
fun must_be_positive(n) {
    assert(n > 0, "Value must be positive, got " + str(n))
    return n
}

try {
    print(must_be_positive(5))
    print(must_be_positive(-3))
} catch (err) {
    print("Assertion failed:", err)
}

# Nested try/catch
try {
    try {
        throw "inner error"
    } catch (e) {
        print("Inner catch:", e)
        throw "re-thrown from inner"
    }
} catch (e) {
    print("Outer catch:", e)
}

print("Program continues normally after error handling")
