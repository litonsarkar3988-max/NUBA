# examples/my.nu  -  The main Nuba demo file
#
#  Run:  python nuba_cli.py examples/my.nu
#  or:   python nuba_cli.py my.nu   (if you copy it)

print("╔══════════════════════════════════════╗")
print("║     Welcome to Nuba Language!        ║")
print("╚══════════════════════════════════════╝")
print()

# ── 1. Variables ──────────────────────────────────────────────────────────────
print("--- Variables ---")
let language = "Nuba"
const VERSION = "1.0.0"
let year = 2024
let pi = 3.14159
print(format("Language: {0} v{1}", language, VERSION))
print("Year:", year, "| Pi:", round(pi, 3))

# ── 2. Functions ──────────────────────────────────────────────────────────────
print("\n--- Functions ---")

fun greet(name, times = 1) {
    let i = 0
    while i < times {
        print("Hello,", name + "!")
        i += 1
    }
}
greet("World")
greet("Nuba", 2)

fun fibonacci(n) {
    if n <= 1 { return n }
    return fibonacci(n - 1) + fibonacci(n - 2)
}
let fibs = map(fun(n) -> fibonacci(n), list(0..10))
print("Fibonacci:", fibs)

# ── 3. Classes ────────────────────────────────────────────────────────────────
print("\n--- Classes ---")

class Shape {
    fun init(self, color) {
        self.color = color
    }
    fun area(self) { return 0 }
    fun describe(self) {
        print(self.color, type(self) + " with area", round(self.area(), 2))
    }
}

class Circle(Shape) {
    fun init(self, color, radius) {
        super.init(color)
        self.radius = radius
    }
    fun area(self) { return PI * self.radius * self.radius }
}

class Rectangle(Shape) {
    fun init(self, color, w, h) {
        super.init(color)
        self.width  = w
        self.height = h
    }
    fun area(self) { return self.width * self.height }
}

let shapes = [
    new Circle("red", 5),
    new Rectangle("blue", 4, 6),
    new Circle("green", 3)
]
for s in shapes {
    s.describe()
}

# ── 4. Collections ────────────────────────────────────────────────────────────
print("\n--- Collections ---")

let scores = {"Alice": 95, "Bob": 82, "Carol": 91, "Dave": 78}
let ranking = sorted(keys(scores), false)

for name in ranking {
    let grade = "A" if scores[name] >= 90 else ("B" if scores[name] >= 80 else "C")
    print(format("  {0}: {1} ({2})", name, scores[name], grade))
}

# ── 5. Error Handling ─────────────────────────────────────────────────────────
print("\n--- Error Handling ---")

fun safe_divide(a, b) {
    try {
        if b == 0 { throw "Cannot divide by zero" }
        return a / b
    } catch (err) {
        print("Error caught:", err)
        return null
    }
}
print("10 / 2 =", safe_divide(10, 2))
print("10 / 0 =", safe_divide(10, 0))

# ── 6. Functional ─────────────────────────────────────────────────────────────
print("\n--- Functional ---")

let numbers = list(1..21)
let result = reduce(
    fun(a, b) -> a + b,
    filter(fun(n) -> n % 2 == 0, numbers)
)
print("Sum of evens 1-20:", result)

# Pipeline
fun pipeline(val, fns) {
    for fn in fns { val = fn(val) }
    return val
}
let transformed = pipeline(5, [
    fun(x) -> x * 3,
    fun(x) -> x + 2,
    fun(x) -> x * x
])
print("Pipeline result:", transformed)

# ── 7. Pattern Matching ───────────────────────────────────────────────────────
print("\n--- Pattern Matching ---")

fun classify(n) {
    match n % 3 {
        case 0 -> { return "divisible by 3" }
        case 1 -> { return "remainder 1" }
        case 2 -> { return "remainder 2" }
        case _ -> { return "other" }
    }
}
for n in [9, 10, 11, 12] {
    print(n, "->", classify(n))
}

# ── 8. Recursion & Algorithms ─────────────────────────────────────────────────
print("\n--- Algorithms ---")

fun quicksort(arr) {
    if len(arr) <= 1 { return arr }
    let pivot  = arr[0]
    let left   = filter(fun(x) -> x < pivot,  arr.slice(1, len(arr)))
    let right  = filter(fun(x) -> x >= pivot, arr.slice(1, len(arr)))
    return quicksort(left) + [pivot] + quicksort(right)
}

let unsorted = [38, 27, 43, 3, 9, 82, 10]
print("Unsorted:", unsorted)
print("Sorted:", quicksort(unsorted))

print("\n✓ Nuba is working perfectly!")
