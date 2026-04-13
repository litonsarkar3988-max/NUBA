# HackerRank Style: Minimum swaps to sort array

fun solve__minimum_swaps(input) {
    print("Solving: Minimum swaps to sort array")
    # Core logic for Minimum swaps to sort array
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__minimum_swaps([1, 2, 3, 4, 5]))
print(solve__minimum_swaps([10, 20, 30]))
