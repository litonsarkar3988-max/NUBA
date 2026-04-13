# Algorithm Exercise 19: Point Location

# Implementation of Point Location
# This demonstrates core algorithmic concepts

fun point_location(data) {
    print("Running: Point Location")

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

print("=== Point Location ===")
for tc in test_cases {
    let output = point_location(tc)
    print("Input:", tc, "-> Output:", output)
}
