# Coding Theory: Relationships (35)

print("=== Coding Theory: Relationships ===")

# Coding Theory exercise 35
# Topic: Relationships

fun demonstrate_relationships_35(input) {
    print("Exercise 35: Relationships")
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
demonstrate_relationships_35([1,2,3,4,5])
demonstrate_relationships_35(10)

# Properties verification
fun verify_relationships_35(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_relationships_35([1,4,9,16,25]))
