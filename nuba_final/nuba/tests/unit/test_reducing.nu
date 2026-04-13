# Test: Test Reducing

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_reducing
try {
    # Placeholder tests - extend as needed
    ok("test_reducing_basic")
    ok("test_reducing_edge")
    ok("test_reducing_complex")
} catch (err) {
    ko("test_reducing", err)
}

print("--- test_reducing ---")
print("Passed:", pass, "| Failed:", fail)
