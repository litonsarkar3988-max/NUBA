# HackerRank Style: Grade rounding algorithm

fun solve__grading_students(input) {
    print("Solving: Grade rounding algorithm")
    # Core logic for Grade rounding algorithm
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__grading_students([1, 2, 3, 4, 5]))
print(solve__grading_students([10, 20, 30]))
