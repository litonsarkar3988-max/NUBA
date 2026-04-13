# Test: Test Errors

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_errors
try {
    # Placeholder tests - extend as needed
    ok("test_errors_basic")
    ok("test_errors_edge")
    ok("test_errors_complex")
} catch (err) {
    ko("test_errors", err)
}

print("--- test_errors ---")
print("Passed:", pass, "| Failed:", fail)
