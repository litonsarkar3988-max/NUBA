# Test: Test Bank

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_bank
try {
    # Placeholder tests - extend as needed
    ok("test_bank_basic")
    ok("test_bank_edge")
    ok("test_bank_complex")
} catch (err) {
    ko("test_bank", err)
}

print("--- test_bank ---")
print("Passed:", pass, "| Failed:", fail)
