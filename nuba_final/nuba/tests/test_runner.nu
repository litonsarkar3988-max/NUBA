# tests/test_runner.nu - Simple test framework for Nuba

let _tests = []
let _passed = 0
let _failed = 0

fun test(name, fn) {
    push(_tests, {"name": name, "fn": fn})
}

fun expect(actual, expected) {
    if actual == expected {
        return true
    }
    throw "Expected " + str(expected) + " but got " + str(actual)
}

fun expect_true(val) {
    if val { return true }
    throw "Expected true but got " + str(val)
}

fun expect_false(val) {
    if not val { return true }
    throw "Expected false but got " + str(val)
}

fun run_tests() {
    print("Running", len(_tests), "tests...")
    print("─────────────────────────────────")
    for t in _tests {
        try {
            t["fn"]()
            print("  ✓", t["name"])
            _passed += 1
        } catch (err) {
            print("  ✗", t["name"])
            print("      →", err)
            _failed += 1
        }
    }
    print("─────────────────────────────────")
    print("Passed:", _passed, "| Failed:", _failed)
    if _failed == 0 {
        print("All tests passed! ✓")
    }
}

# ── Test cases ────────────────────────────────────────────────────────────────

test("addition works", fun() -> {
    expect(1 + 1, 2)
    expect(10 + 20, 30)
})

test("subtraction works", fun() -> {
    expect(10 - 3, 7)
    expect(0 - 5, -5)
})

test("multiplication works", fun() -> {
    expect(3 * 4, 12)
    expect(0 * 999, 0)
})

test("division works", fun() -> {
    expect(10 / 2, 5)
    expect(9 / 3, 3)
})

test("modulo works", fun() -> {
    expect(10 % 3, 1)
    expect(8 % 4, 0)
})

test("power works", fun() -> {
    expect(2 ** 8, 256)
    expect(3 ** 3, 27)
})

test("string concatenation", fun() -> {
    expect("Hello" + ", " + "World!", "Hello, World!")
})

test("string length", fun() -> {
    expect(len("Nuba"), 4)
    expect(len(""), 0)
})

test("list operations", fun() -> {
    let lst = [1, 2, 3]
    push(lst, 4)
    expect(len(lst), 4)
    expect(lst[3], 4)
    let last = pop(lst)
    expect(last, 4)
    expect(len(lst), 3)
})

test("dict operations", fun() -> {
    let d = {"a": 1, "b": 2}
    expect(d["a"], 1)
    d["c"] = 3
    expect(has(d, "c"), true)
    expect(len(keys(d)), 3)
})

test("boolean logic", fun() -> {
    expect_true(true and true)
    expect_false(true and false)
    expect_true(true or false)
    expect_false(false or false)
    expect_true(not false)
})

test("comparison operators", fun() -> {
    expect_true(1 < 2)
    expect_true(2 > 1)
    expect_true(2 >= 2)
    expect_true(2 <= 2)
    expect_true(2 == 2)
    expect_true(2 != 3)
})

test("if/else", fun() -> {
    let x = 10
    let result = "big" if x > 5 else "small"
    expect(result, "big")
})

test("for loop", fun() -> {
    let sum = 0
    for i in 1..6 { sum += i }
    expect(sum, 15)
})

test("while loop", fun() -> {
    let count = 0
    while count < 5 { count += 1 }
    expect(count, 5)
})

test("functions and return", fun() -> {
    fun double(x) { return x * 2 }
    expect(double(7), 14)
})

test("closures", fun() -> {
    fun make_adder(n) { return fun(x) -> x + n }
    let add5 = make_adder(5)
    expect(add5(10), 15)
})

test("recursion", fun() -> {
    fun fact(n) { if n <= 1 { return 1 } return n * fact(n-1) }
    expect(fact(5), 120)
})

test("map builtin", fun() -> {
    let result = map(fun(x) -> x * 2, [1, 2, 3])
    expect(result, [2, 4, 6])
})

test("filter builtin", fun() -> {
    let result = filter(fun(x) -> x % 2 == 0, [1,2,3,4,5,6])
    expect(result, [2, 4, 6])
})

test("reduce builtin", fun() -> {
    let result = reduce(fun(a, b) -> a + b, [1, 2, 3, 4, 5])
    expect(result, 15)
})

test("error handling", fun() -> {
    let caught = false
    try {
        throw "test error"
    } catch (err) {
        caught = true
    }
    expect_true(caught)
})

test("classes and instances", fun() -> {
    class Point {
        fun init(self, x, y) { self.x = x; self.y = y }
        fun dist(self) { return sqrt(self.x * self.x + self.y * self.y) }
    }
    let p = new Point(3, 4)
    expect(p.x, 3)
    expect(p.dist(), 5.0)
})

test("math builtins", fun() -> {
    expect(abs(-5), 5)
    expect(max([1,2,3]), 3)
    expect(min([1,2,3]), 1)
    expect(sum([1,2,3,4]), 10)
})

run_tests()
