# Optimization Theory: Examples (58)

print("=== Optimization Theory: Examples ===")

# Optimization Theory exercise 58
# Topic: Examples

fun demonstrate_examples_58(input) {
    print("Exercise 58: Examples")
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
demonstrate_examples_58([1,2,3,4,5])
demonstrate_examples_58(10)

# Properties verification
fun verify_examples_58(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_examples_58([1,4,9,16,25]))
