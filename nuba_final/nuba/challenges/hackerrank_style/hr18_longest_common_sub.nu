# HackerRank Style: Longest common subsequence

fun solve__longest_common_sub(input) {
    print("Solving: Longest common subsequence")
    # Core logic for Longest common subsequence
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__longest_common_sub([1, 2, 3, 4, 5]))
print(solve__longest_common_sub([10, 20, 30]))
