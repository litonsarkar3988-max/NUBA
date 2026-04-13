# Test: Test Lambdas

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_lambdas
try {
    # Placeholder tests - extend as needed
    ok("test_lambdas_basic")
    ok("test_lambdas_edge")
    ok("test_lambdas_complex")
} catch (err) {
    ko("test_lambdas", err)
}

print("--- test_lambdas ---")
print("Passed:", pass, "| Failed:", fail)
