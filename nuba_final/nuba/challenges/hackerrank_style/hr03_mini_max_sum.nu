# HackerRank Style: Mini-Max Sum of 4 of 5 numbers

fun solve__mini_max_sum(input) {
    print("Solving: Mini-Max Sum of 4 of 5 numbers")
    # Core logic for Mini-Max Sum of 4 of 5 numbers
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__mini_max_sum([1, 2, 3, 4, 5]))
print(solve__mini_max_sum([10, 20, 30]))
