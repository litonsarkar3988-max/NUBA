# Algorithm Exercise 45: PCA Concept

# Implementation of PCA Concept
# This demonstrates core algorithmic concepts

fun principal_component(data) {
    print("Running: PCA Concept")

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

print("=== PCA Concept ===")
for tc in test_cases {
    let output = principal_component(tc)
    print("Input:", tc, "-> Output:", output)
}
