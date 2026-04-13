# Topology: Theory (56)

print("=== Topology: Theory ===")

# Topology exercise 56
# Topic: Theory

fun demonstrate_theory_56(input) {
    print("Exercise 56: Theory")
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
demonstrate_theory_56([1,2,3,4,5])
demonstrate_theory_56(10)

# Properties verification
fun verify_theory_56(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_theory_56([1,4,9,16,25]))
