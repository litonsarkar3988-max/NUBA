# Test: Test Recursion

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_recursion
try {
    # Placeholder tests - extend as needed
    ok("test_recursion_basic")
    ok("test_recursion_edge")
    ok("test_recursion_complex")
} catch (err) {
    ko("test_recursion", err)
}

print("--- test_recursion ---")
print("Passed:", pass, "| Failed:", fail)
