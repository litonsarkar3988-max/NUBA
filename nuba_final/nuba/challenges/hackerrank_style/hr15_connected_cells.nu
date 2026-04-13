# HackerRank Style: Max region in grid

fun solve__connected_cells(input) {
    print("Solving: Max region in grid")
    # Core logic for Max region in grid
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__connected_cells([1, 2, 3, 4, 5]))
print(solve__connected_cells([10, 20, 30]))
