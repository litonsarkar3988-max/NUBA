# Complex Analysis: Analysis (16)

print("=== Complex Analysis: Analysis ===")

# Complex Analysis exercise 16
# Topic: Analysis

fun demonstrate_analysis_16(input) {
    print("Exercise 16: Analysis")
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
demonstrate_analysis_16([1,2,3,4,5])
demonstrate_analysis_16(10)

# Properties verification
fun verify_analysis_16(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_analysis_16([1,4,9,16,25]))
