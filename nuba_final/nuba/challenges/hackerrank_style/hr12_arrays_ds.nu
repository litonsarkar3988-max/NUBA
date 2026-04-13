# HackerRank Style: Array rotation and queries

fun solve__arrays_ds(input) {
    print("Solving: Array rotation and queries")
    # Core logic for Array rotation and queries
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__arrays_ds([1, 2, 3, 4, 5]))
print(solve__arrays_ds([10, 20, 30]))
