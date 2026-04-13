# Unit Tests: Strings
let pass=0
let fail=0

fun check(name, got, expected) {
    if got == expected { pass += 1; print("  ✓", name) }
    else { fail += 1; print("  ✗", name, "got:", got, "expected:", expected) }
}

check("len", len('hello'), 5)
check("upper", upper('hello'), "HELLO")
check("lower", lower('HELLO'), "hello")
check("concat", 'a' + 'b', "ab")
check("trim_len", len(trim('  hi  ')), 2)
check("contains_true", contains('hello','ell'), true)
check("contains_false", contains('hello','xyz'), false)
check("substr", substr('nuba',1,3), "ub")

print("---")
print("Passed:", pass, "| Failed:", fail)
