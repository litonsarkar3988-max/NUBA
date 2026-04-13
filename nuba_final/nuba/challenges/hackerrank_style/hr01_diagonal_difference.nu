# HackerRank Style: Diagonal Difference in Matrix

fun solve__diagonal_difference(input) {
    print("Solving: Diagonal Difference in Matrix")
    # Core logic for Diagonal Difference in Matrix
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__diagonal_difference([1, 2, 3, 4, 5]))
print(solve__diagonal_difference([10, 20, 30]))
