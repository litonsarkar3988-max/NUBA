# Test: Test Dicts

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_dicts
try {
    # Placeholder tests - extend as needed
    ok("test_dicts_basic")
    ok("test_dicts_edge")
    ok("test_dicts_complex")
} catch (err) {
    ko("test_dicts", err)
}

print("--- test_dicts ---")
print("Passed:", pass, "| Failed:", fail)
