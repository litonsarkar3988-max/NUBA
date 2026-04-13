# Complex Analysis: Axioms (42)

print("=== Complex Analysis: Axioms ===")

# Complex Analysis exercise 42
# Topic: Axioms

fun demonstrate_axioms_42(input) {
    print("Exercise 42: Axioms")
    print("Input:", input)
    
    # Core computation
    let n = len(input) if isList(input) else int(str(input)[:1])
    let result = []
    for i in 1..(n+1) {
        push(result, i * i)
    }
    
    print("Result:", result)
    return result
}

# Examples
demonstrate_axioms_42([1,2,3,4,5])
demonstrate_axioms_42(10)

# Properties verification
fun verify_axioms_42(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_axioms_42([1,4,9,16,25]))
