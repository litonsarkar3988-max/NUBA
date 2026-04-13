# Algorithm Exercise 08: Prefix Sum Arrays

# Implementation of Prefix Sum Arrays
# This demonstrates core algorithmic concepts

fun prefix_sum(data) {
    print("Running: Prefix Sum Arrays")

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

print("=== Prefix Sum Arrays ===")
for tc in test_cases {
    let output = prefix_sum(tc)
    print("Input:", tc, "-> Output:", output)
}
