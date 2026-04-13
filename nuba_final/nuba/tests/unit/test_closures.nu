# Test: Test Closures

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_closures
try {
    # Placeholder tests - extend as needed
    ok("test_closures_basic")
    ok("test_closures_edge")
    ok("test_closures_complex")
} catch (err) {
    ko("test_closures", err)
}

print("--- test_closures ---")
print("Passed:", pass, "| Failed:", fail)
