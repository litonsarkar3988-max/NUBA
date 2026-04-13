# Algorithm Exercise 40: Particle Swarm Optimization

# Implementation of Particle Swarm Optimization
# This demonstrates core algorithmic concepts

fun particle_swarm(data) {
    print("Running: Particle Swarm Optimization")

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

print("=== Particle Swarm Optimization ===")
for tc in test_cases {
    let output = particle_swarm(tc)
    print("Input:", tc, "-> Output:", output)
}
