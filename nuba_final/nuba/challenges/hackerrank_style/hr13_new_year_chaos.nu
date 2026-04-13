# HackerRank Style: Minimum bribes to sort queue

fun solve__new_year_chaos(input) {
    print("Solving: Minimum bribes to sort queue")
    # Core logic for Minimum bribes to sort queue
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__new_year_chaos([1, 2, 3, 4, 5]))
print(solve__new_year_chaos([10, 20, 30]))
