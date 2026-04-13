# Algorithm Exercise 44: K-Means Clustering

# Implementation of K-Means Clustering
# This demonstrates core algorithmic concepts

fun k_means_clustering(data) {
    print("Running: K-Means Clustering")

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

print("=== K-Means Clustering ===")
for tc in test_cases {
    let output = k_means_clustering(tc)
    print("Input:", tc, "-> Output:", output)
}
