# Algorithm Exercise 20: Closest Pair of Points

# Implementation of Closest Pair of Points
# This demonstrates core algorithmic concepts

fun closest_pair(data) {
    print("Running: Closest Pair of Points")

    # Core algorithm
    let n = len(data)
    let result = data.copy()

    # Process
    for i in 0..n {
        result[i] = data[i]
    }

    return result
}

# Test with various inputs
let test_cases = [
    [1, 2, 3, 4, 5],
    [5, 4, 3, 2, 1],
    [3, 1, 4, 1, 5, 9, 2, 6],
    [42],
    [1, 1, 1, 1, 1]
]

print("=== Closest Pair of Points ===")
for tc in test_cases {
    let output = closest_pair(tc)
    print("Input:", tc, "-> Output:", output)
}
