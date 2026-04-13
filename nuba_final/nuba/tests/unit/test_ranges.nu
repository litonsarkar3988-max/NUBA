# Test: Test Ranges

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_ranges
try {
    # Placeholder tests - extend as needed
    ok("test_ranges_basic")
    ok("test_ranges_edge")
    ok("test_ranges_complex")
} catch (err) {
    ko("test_ranges", err)
}

print("--- test_ranges ---")
print("Passed:", pass, "| Failed:", fail)
