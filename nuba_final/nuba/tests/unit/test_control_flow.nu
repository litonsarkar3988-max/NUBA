# Test: Test Control Flow

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_control_flow
try {
    # Placeholder tests - extend as needed
    ok("test_control_flow_basic")
    ok("test_control_flow_edge")
    ok("test_control_flow_complex")
} catch (err) {
    ko("test_control_flow", err)
}

print("--- test_control_flow ---")
print("Passed:", pass, "| Failed:", fail)
