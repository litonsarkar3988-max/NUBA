# Game Theory Advanced: Categories (82)

print("=== Game Theory Advanced: Categories ===")

# Game Theory Advanced exercise 82
# Topic: Categories

fun demonstrate_categories_82(input) {
    print("Exercise 82: Categories")
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
demonstrate_categories_82([1,2,3,4,5])
demonstrate_categories_82(10)

# Properties verification
fun verify_categories_82(data) {
    let n = len(data)
    if n == 0 { return true }
    let sorted_data = sorted(data)
    let is_sorted = true
    for i in 0..(n-1) {
        if sorted_data[i] > sorted_data[i+1] { is_sorted = false }
    }
    return is_sorted
}

print("Verification:", verify_categories_82([1,4,9,16,25]))
