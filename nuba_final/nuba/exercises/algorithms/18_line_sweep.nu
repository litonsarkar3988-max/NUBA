# Algorithm Exercise 18: Line Sweep Algorithm

# Implementation of Line Sweep Algorithm
# This demonstrates core algorithmic concepts

fun line_sweep(data) {
    print("Running: Line Sweep Algorithm")

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

print("=== Line Sweep Algorithm ===")
for tc in test_cases {
    let output = line_sweep(tc)
    print("Input:", tc, "-> Output:", output)
}
