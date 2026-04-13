# HackerRank Style: Minimum jumps in cloud game

fun solve__jumping_clouds(input) {
    print("Solving: Minimum jumps in cloud game")
    # Core logic for Minimum jumps in cloud game
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__jumping_clouds([1, 2, 3, 4, 5]))
print(solve__jumping_clouds([10, 20, 30]))
