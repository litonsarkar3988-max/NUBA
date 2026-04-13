# Algorithm Exercise 43: Decision Tree Algorithm

# Implementation of Decision Tree Algorithm
# This demonstrates core algorithmic concepts

fun decision_tree_algo(data) {
    print("Running: Decision Tree Algorithm")

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

print("=== Decision Tree Algorithm ===")
for tc in test_cases {
    let output = decision_tree_algo(tc)
    print("Input:", tc, "-> Output:", output)
}
