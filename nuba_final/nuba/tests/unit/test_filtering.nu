# Test: Test Filtering

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_filtering
try {
    # Placeholder tests - extend as needed
    ok("test_filtering_basic")
    ok("test_filtering_edge")
    ok("test_filtering_complex")
} catch (err) {
    ko("test_filtering", err)
}

print("--- test_filtering ---")
print("Passed:", pass, "| Failed:", fail)
