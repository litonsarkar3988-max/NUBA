# Numerical Analysis: Transformations (100)

print("=== Numerical Analysis: Transformations ===")

# Numerical Analysis exercise 100
# Topic: Transformations

fun demonstrate_transformations_100(input) {
    print("Exercise 100: Transformations")
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
demonstrate_transformations_100([1,2,3,4,5])
demonstrate_transformations_100(10)

# Properties verification
fun verify_transformations_100(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_transformations_100([1,4,9,16,25]))
