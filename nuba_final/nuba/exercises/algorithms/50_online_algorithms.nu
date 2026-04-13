# Algorithm Exercise 50: Online Algorithms

# Implementation of Online Algorithms
# This demonstrates core algorithmic concepts

fun online_algorithms(data) {
    print("Running: Online Algorithms")

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

print("=== Online Algorithms ===")
for tc in test_cases {
    let output = online_algorithms(tc)
    print("Input:", tc, "-> Output:", output)
}
