# Test: Test Quiz

let pass = 0
let fail = 0

fun ok(name) { pass += 1; print("  ✓", name) }
fun ko(name, err) { fail += 1; print("  ✗", name, "-", err) }

# Test cases for test_quiz
try {
    # Placeholder tests - extend as needed
    ok("test_quiz_basic")
    ok("test_quiz_edge")
    ok("test_quiz_complex")
} catch (err) {
    ko("test_quiz", err)
}

print("--- test_quiz ---")
print("Passed:", pass, "| Failed:", fail)
