# tests/test_features.nu - Comprehensive feature tests

let pass = 0
let fail = 0

fun check(label, got, expected) {
    if got == expected {
        pass += 1
    } else {
        fail += 1
        print("FAIL:", label)
        print("  expected:", expected)
        print("  got:     ", got)
    }
}

fun check_true(label, val) {
    check(label, val, true)
}

fun check_approx(label, got, expected, tol) {
    let diff = got - expected
    if diff < 0 { diff = -diff }
    check_true(label + " (approx)", diff <= tol)
}

# ── Numbers ───────────────────────────────────────────────────────────────────
check("int literal",    42,    42)
check("float literal",  3.14,  3.14)
check("neg int",       -7,    -7)
check("add ints",       3+4,   7)
check("sub ints",       10-3,  7)
check("mul ints",       4*5,   20)
check("int div",        9/3,   3)
check("modulo",         10%3,  1)
check("power",          2**8,  256)
check("abs pos",        abs(5),  5)
check("abs neg",        abs(-5), 5)
check("floor",          floor(3.9), 3)
check("ceil",           ceil(3.1),  4)
check("round",          round(3.5, 0), 4.0)

# ── Strings ───────────────────────────────────────────────────────────────────
check("string lit",     "hello", "hello")
check("concat",         "a"+"b", "ab")
check("str len",        len("nuba"), 4)
check("upper",          upper("hello"), "HELLO")
check("lower",          lower("HELLO"), "hello")
check("trim",           trim("  hi  "), "hi")
check("contains",       contains("hello", "ell"), true)
check("startswith",     startswith("nuba", "nu"), true)
check("endswith",       endswith("nuba", "ba"), true)
check("replace",        replace("hello", "l", "r"), "herro")
check("substr",         substr("nuba", 1, 3), "ub")
check("indexOf",        indexOf("nuba", "b"), 2)
check("split",          split("a,b,c", ","), ["a","b","c"])
check("join",           join(["a","b","c"], "-"), "a-b-c")

# ── Booleans ──────────────────────────────────────────────────────────────────
check("true",           true, true)
check("false",          false, false)
check("and T T",        true and true, true)
check("and T F",        true and false, false)
check("or T F",         true or false, true)
check("or F F",         false or false, false)
check("not T",          not true, false)
check("not F",          not false, true)

# ── Comparison ────────────────────────────────────────────────────────────────
check("eq",   2==2, true)
check("neq",  2!=3, true)
check("lt",   1<2,  true)
check("gt",   2>1,  true)
check("lte",  2<=2, true)
check("gte",  2>=2, true)

# ── Lists ─────────────────────────────────────────────────────────────────────
let lst = [1,2,3,4,5]
check("list idx",     lst[0], 1)
check("list len",     len(lst), 5)
check("list max",     max(lst), 5)
check("list min",     min(lst), 1)
check("list sum",     sum(lst), 15)
check("map",          map(fun(x)->x*2, [1,2,3]), [2,4,6])
check("filter",       filter(fun(x)->x>3, lst), [4,5])
check("reduce",       reduce(fun(a,b)->a+b, lst), 15)
check("sorted asc",   sorted([3,1,2]), [1,2,3])
check("reversed",     reversed([1,2,3]), [3,2,1])
check("zip",          zip([1,2],[3,4]), [[1,3],[2,4]])

# ── Dicts ─────────────────────────────────────────────────────────────────────
let d = {"a":1, "b":2}
check("dict get",     d["a"], 1)
check("dict has",     has(d, "a"), true)
check("dict no key",  has(d, "z"), false)

# ── Control flow ──────────────────────────────────────────────────────────────
let x = 10
let r1 = "big" if x > 5 else "small"
check("ternary",      r1, "big")

let s1 = 0
for i in 0..5 { s1 += i }
check("for loop sum", s1, 10)

let s2 = 0
let n = 1
while n <= 5 { s2 += n; n += 1 }
check("while sum", s2, 15)

# ── Functions ─────────────────────────────────────────────────────────────────
fun fact(n) { if n<=1 {return 1} return n*fact(n-1) }
check("factorial 5",  fact(5), 120)
check("factorial 0",  fact(0), 1)

fun add_default(a, b=10) { return a + b }
check("default param", add_default(5), 15)

let lam = fun(x) -> x * x
check("lambda", lam(7), 49)

# ── Math ──────────────────────────────────────────────────────────────────────
check_approx("sqrt 4",  sqrt(4.0), 2.0, 0.0001)
check_approx("PI",      PI, 3.14159, 0.001)
check_approx("sin 0",   sin(0), 0.0, 0.0001)
check_approx("cos 0",   cos(0), 1.0, 0.0001)

# ── Error handling ────────────────────────────────────────────────────────────
let caught = false
try { throw "test" } catch (e) { caught = true }
check_true("try/catch", caught)

let finally_ran = false
try { } finally { finally_ran = true }
check_true("finally", finally_ran)

# ── Classes ───────────────────────────────────────────────────────────────────
class Pt {
    fun init(self, x, y) { self.x=x; self.y=y }
    fun sum(self) { return self.x + self.y }
}
let pt = new Pt(3, 4)
check("class field",  pt.x, 3)
check("class method", pt.sum(), 7)

# ── Summary ───────────────────────────────────────────────────────────────────
print("─────────────────────────────────")
print("Tests passed:", pass)
print("Tests failed:", fail)
if fail == 0 {
    print("All tests passed! ✓")
} else {
    print("Some tests FAILED!")
}
