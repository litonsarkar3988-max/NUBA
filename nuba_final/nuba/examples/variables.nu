# examples/variables.nu - Variables and types in Nuba

# Integer
let age = 25
print("Age:", age)

# Float
let price = 9.99
print("Price:", price)

# String
let greeting = "Hello, Nuba!"
print(greeting)

# Boolean
let is_active = true
let is_done   = false
print("Active:", is_active)

# Null
let nothing = null
print("Nothing:", nothing)

# Constant (cannot be reassigned)
const MAX = 100
print("Max value:", MAX)

# Type checking
print("Type of age:", type(age))
print("Type of price:", type(price))
print("Type of greeting:", type(greeting))

# Type conversion
let num_str = "42"
let num     = int(num_str)
print("Converted:", num + 8)

# String interpolation (format)
let name = "World"
let msg  = format("Hello, {0}! You are {1} years old.", name, age)
print(msg)

# Multiple assignment
let x = 10
let y = 20
print("x + y =", x + y)
print("x * y =", x * y)
print("x ** 2 =", x ** 2)
print("y / 3 =", y / 3)
print("y % 3 =", y % 3)
