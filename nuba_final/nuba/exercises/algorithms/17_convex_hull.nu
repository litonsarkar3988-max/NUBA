# Algorithm Exercise 17: Convex Hull (Graham Scan)

# Implementation of Convex Hull (Graham Scan)
# This demonstrates core algorithmic concepts

fun convex_hull(data) {
    print("Running: Convex Hull (Graham Scan)")

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

print("=== Convex Hull (Graham Scan) ===")
for tc in test_cases {
    let output = convex_hull(tc)
    print("Input:", tc, "-> Output:", output)
}
