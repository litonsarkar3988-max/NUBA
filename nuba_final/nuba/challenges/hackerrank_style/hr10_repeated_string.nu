# HackerRank Style: Count 'a' in repeated string

fun solve__repeated_string(input) {
    print("Solving: Count 'a' in repeated string")
    # Core logic for Count 'a' in repeated string
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__repeated_string([1, 2, 3, 4, 5]))
print(solve__repeated_string([10, 20, 30]))
