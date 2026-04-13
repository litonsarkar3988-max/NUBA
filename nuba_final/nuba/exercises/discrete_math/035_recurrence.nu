# Discrete Math: Recurrence

print("=== Recurrence ===")

# Discrete mathematics implementations

fun gcd_extended(a, b) {
    if b == 0 { return [a, 1, 0] }
    let r = gcd_extended(b, a % b)
    return [r[0], r[2], r[1] - floor(a/b)*r[2]]
}

fun is_prime_dm(n) {
    if n < 2 { return false }
    if n == 2 { return true }
    if n % 2 == 0 { return false }
    let i = 3
    while i*i <= n { if n%i==0 { return false }; i+=2 }
    return true
}

fun power_set_dm(lst) {
    let result = [[]]
    for x in lst {
        let new_sets = map(fun(s) -> s + [x], result)
        result = result + new_sets
    }
    return result
}

fun permutations_count(n, r) {
    let result = 1
    for i in 0..r { result *= (n - i) }
    return result
}

fun combinations_count(n, r) {
    if r > n { return 0 }
    if r == 0 or r == n { return 1 }
    return permutations_count(n, r) / permutations_count(r, r)
}

fun truth_table(fn, vars) {
    let n = len(vars)
    let rows = 2 ** n
    print("Truth Table:")
    print("  " + join(vars, " | ") + " | Result")
    for i in 0..rows {
        let values = {}
        let row = ""
        for j in 0..n {
            let v = bool(floor(i / (2 ** (n-1-j))) % 2)
            values[vars[j]] = v
            row += ("T" if v else "F") + " | "
        }
        let result = fn(values)
        print("  " + row + ("T" if result else "F"))
    }
}

# Demo for Recurrence
print("GCD extended(35, 15):", gcd_extended(35, 15))
print("Primes 1-30:", filter(fun(n)->is_prime_dm(n), list(1..31)))
print("Power set [1,2,3]:", power_set_dm([1,2,3]))
print("P(5,3) =", permutations_count(5,3))
print("C(5,3) =", combinations_count(5,3))

print("\nTruth table for A AND B:")
truth_table(fun(v)->v["A"] and v["B"], ["A","B"])
print("\nTruth table for A OR (NOT B):")
truth_table(fun(v)->v["A"] or not v["B"], ["A","B"])
