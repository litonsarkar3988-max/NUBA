# Algorithm Exercise 42: Neural Network Basics

# Implementation of Neural Network Basics
# This demonstrates core algorithmic concepts

fun neural_network_basic(data) {
    print("Running: Neural Network Basics")

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

print("=== Neural Network Basics ===")
for tc in test_cases {
    let output = neural_network_basic(tc)
    print("Input:", tc, "-> Output:", output)
}
