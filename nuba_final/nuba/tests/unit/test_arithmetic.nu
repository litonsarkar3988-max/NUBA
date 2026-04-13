# Unit Tests: Arithmetic
let pass=0
let fail=0

fun check(name, got, expected) {
    if got == expected { pass += 1; print("  ✓", name) }
    else { fail += 1; print("  ✗", name, "got:", got, "expected:", expected) }
}

check("addition", 3 + 4, 7)
check("subtraction", 10 - 3, 7)
check("multiplication", 4 * 5, 20)
check("division", 10 / 2, 5)
check("modulo", 10 % 3, 1)
check("power", 2 ** 8, 256)
check("neg", -5 + 10, 5)
check("float_add", 1.5 + 2.5, 4.0)

print("---")
print("Passed:", pass, "| Failed:", fail)
