# Combinatorics: Methods (62)

print("=== Combinatorics: Methods ===")

# Combinatorics exercise 62
# Topic: Methods

fun demonstrate_methods_62(input) {
    print("Exercise 62: Methods")
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
demonstrate_methods_62([1,2,3,4,5])
demonstrate_methods_62(10)

# Properties verification
fun verify_methods_62(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_methods_62([1,4,9,16,25]))
