# Unit Tests: Lists
let pass=0
let fail=0

fun check(name, got, expected) {
    if got == expected { pass += 1; print("  ✓", name) }
    else { fail += 1; print("  ✗", name, "got:", got, "expected:", expected) }
}

check("len", len([1,2,3]), 3)
check("sum_list", sum([1,2,3,4,5]), 15)
check("max_list", max([3,1,4,1,5,9,2]), 9)
check("min_list", min([3,1,4,1,5,9,2]), 1)
check("sorted_asc", sorted([3,1,2]), [1, 2, 3])
check("reversed_list", reversed([1,2,3]), [3, 2, 1])

print("---")
print("Passed:", pass, "| Failed:", fail)
