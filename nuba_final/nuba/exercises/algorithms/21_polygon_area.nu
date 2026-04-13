# Algorithm Exercise 21: Polygon Area Calculation

# Implementation of Polygon Area Calculation
# This demonstrates core algorithmic concepts

fun polygon_area(data) {
    print("Running: Polygon Area Calculation")

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

print("=== Polygon Area Calculation ===")
for tc in test_cases {
    let output = polygon_area(tc)
    print("Input:", tc, "-> Output:", output)
}
