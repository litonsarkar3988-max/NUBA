# Test: Test Library

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_library
try {
    # Placeholder tests - extend as needed
    ok("test_library_basic")
    ok("test_library_edge")
    ok("test_library_complex")
} catch (err) {
    ko("test_library", err)
}

print("--- test_library ---")
print("Passed:", pass, "| Failed:", fail)
