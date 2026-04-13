# Algorithm Exercise 13: Number Theory Algorithms

# Implementation of Number Theory Algorithms
# This demonstrates core algorithmic concepts

fun number_theory_algo(data) {
    print("Running: Number Theory Algorithms")

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

print("=== Number Theory Algorithms ===")
for tc in test_cases {
    let output = number_theory_algo(tc)
    print("Input:", tc, "-> Output:", output)
}
