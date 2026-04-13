# HackerRank Style: Apple and Orange on a house

fun solve__apple_orange(input) {
    print("Solving: Apple and Orange on a house")
    # Core logic for Apple and Orange on a house
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__apple_orange([1, 2, 3, 4, 5]))
print(solve__apple_orange([10, 20, 30]))
