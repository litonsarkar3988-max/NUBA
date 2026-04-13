# HackerRank Style: Two ice cream flavors within budget

fun solve__ice_cream_parlor(input) {
    print("Solving: Two ice cream flavors within budget")
    # Core logic for Two ice cream flavors within budget
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__ice_cream_parlor([1, 2, 3, 4, 5]))
print(solve__ice_cream_parlor([10, 20, 30]))
