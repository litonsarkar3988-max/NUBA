# HackerRank Style: Count pairs with equal values

fun solve__sherlock_pairs(input) {
    print("Solving: Count pairs with equal values")
    # Core logic for Count pairs with equal values
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__sherlock_pairs([1, 2, 3, 4, 5]))
print(solve__sherlock_pairs([10, 20, 30]))
