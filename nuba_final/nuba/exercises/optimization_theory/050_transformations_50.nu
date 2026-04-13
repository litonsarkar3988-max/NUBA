# Optimization Theory: Transformations (50)

print("=== Optimization Theory: Transformations ===")

# Optimization Theory exercise 50
# Topic: Transformations

fun demonstrate_transformations_50(input) {
    print("Exercise 50: Transformations")
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
demonstrate_transformations_50([1,2,3,4,5])
demonstrate_transformations_50(10)

# Properties verification
fun verify_transformations_50(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_transformations_50([1,4,9,16,25]))
