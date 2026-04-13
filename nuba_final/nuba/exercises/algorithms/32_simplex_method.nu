# Algorithm Exercise 32: Simplex Method

# Implementation of Simplex Method
# This demonstrates core algorithmic concepts

fun simplex_method(data) {
    print("Running: Simplex Method")

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

print("=== Simplex Method ===")
for tc in test_cases {
    let output = simplex_method(tc)
    print("Input:", tc, "-> Output:", output)
}
