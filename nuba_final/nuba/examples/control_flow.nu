# examples/control_flow.nu - Control flow in Nuba

# If / elif / else
let score = 85

if score >= 90 {
    print("Grade: A")
} elif score >= 80 {
    print("Grade: B")
} elif score >= 70 {
    print("Grade: C")
} elif score >= 60 {
    print("Grade: D")
} else {
    print("Grade: F")
}

# While loop
let i = 0
let total = 0
while i < 10 {
    total += i
    i += 1
}
print("Sum 0-9:", total)

# For loop over list
let fruits = ["apple", "banana", "cherry", "date"]
for fruit in fruits {
    print("Fruit:", fruit)
}

# For loop over range
let squares = []
for n in 1..11 {
    push(squares, n * n)
}
print("Squares:", squares)

# Break and continue
print("Even numbers < 20:")
for n in 0..20 {
    if n % 2 != 0 { continue }
    if n >= 14    { break }
    print(n)
}

# Nested loops
print("Multiplication table (3x3):")
for i in 1..4 {
    for j in 1..4 {
        print(i, "x", j, "=", i * j)
    }
}

# Match statement (pattern matching)
let day = "Monday"
match day {
    case "Saturday" -> {
        print("Weekend!")
    }
    case "Sunday" -> {
        print("Weekend!")
    }
    case _ -> {
        print("Weekday:", day)
    }
}

# Ternary expression
let x = 15
let label = "odd" if x % 2 != 0 else "even"
print(x, "is", label)

# Logical operators
let a = true
let b = false
print("a and b:", a and b)
print("a or b:", a or b)
print("not a:", not a)
