# HackerRank Style: Count valley walks

fun solve__counting_valleys(input) {
    print("Solving: Count valley walks")
    # Core logic for Count valley walks
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__counting_valleys([1, 2, 3, 4, 5]))
print(solve__counting_valleys([10, 20, 30]))
