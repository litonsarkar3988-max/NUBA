# HackerRank Style: Print staircase pattern

fun solve__staircase(input) {
    print("Solving: Print staircase pattern")
    # Core logic for Print staircase pattern
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__staircase([1, 2, 3, 4, 5]))
print(solve__staircase([10, 20, 30]))
