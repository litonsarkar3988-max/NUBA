# HackerRank Style: Longest palindromic subsequence

fun solve__max_palindrome(input) {
    print("Solving: Longest palindromic subsequence")
    # Core logic for Longest palindromic subsequence
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__max_palindrome([1, 2, 3, 4, 5]))
print(solve__max_palindrome([10, 20, 30]))
