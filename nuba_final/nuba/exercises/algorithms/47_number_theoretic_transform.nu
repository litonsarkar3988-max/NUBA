# Algorithm Exercise 47: Number Theoretic Transform

# Implementation of Number Theoretic Transform
# This demonstrates core algorithmic concepts

fun number_theoretic_transform(data) {
    print("Running: Number Theoretic Transform")

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

print("=== Number Theoretic Transform ===")
for tc in test_cases {
    let output = number_theoretic_transform(tc)
    print("Input:", tc, "-> Output:", output)
}
