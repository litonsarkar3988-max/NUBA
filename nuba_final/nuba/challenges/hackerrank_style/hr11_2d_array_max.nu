# HackerRank Style: Max hourglass sum in 2D array

fun solve__2d_array_max(input) {
    print("Solving: Max hourglass sum in 2D array")
    # Core logic for Max hourglass sum in 2D array
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__2d_array_max([1, 2, 3, 4, 5]))
print(solve__2d_array_max([10, 20, 30]))
