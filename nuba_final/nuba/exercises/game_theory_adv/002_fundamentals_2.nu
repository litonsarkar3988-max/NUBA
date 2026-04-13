# Game Theory Advanced: Fundamentals (2)

print("=== Game Theory Advanced: Fundamentals ===")

# Game Theory Advanced exercise 2
# Topic: Fundamentals

fun demonstrate_fundamentals_2(input) {
    print("Exercise 2: Fundamentals")
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
demonstrate_fundamentals_2([1,2,3,4,5])
demonstrate_fundamentals_2(10)

# Properties verification
fun verify_fundamentals_2(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_fundamentals_2([1,4,9,16,25]))
