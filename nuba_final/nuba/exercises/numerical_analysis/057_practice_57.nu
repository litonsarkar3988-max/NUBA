# Numerical Analysis: Practice (57)

print("=== Numerical Analysis: Practice ===")

# Numerical Analysis exercise 57
# Topic: Practice

fun demonstrate_practice_57(input) {
    print("Exercise 57: Practice")
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
demonstrate_practice_57([1,2,3,4,5])
demonstrate_practice_57(10)

# Properties verification
fun verify_practice_57(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_practice_57([1,4,9,16,25]))
