# Concept Tutorial 2: Recursion vs Iteration

# This tutorial explains: Recursion vs Iteration
# With practical Nuba examples

print("=== Recursion vs Iteration ===")
print()

# Example 1: Basic demonstration
fun example_1() {
    print("Example 1: Basic Recursion vs Iteration")
    let data = [10, 30, 20, 50, 40, 80, 70]
    print("Input:", data)
    let result = sorted(data)
    print("Output:", result)
}

# Example 2: More complex case
fun example_2() {
    print("\nExample 2: Applied Recursion vs Iteration")
    let n = 10
    let result = []
    for i in 1..(n+1) { push(result, i*i) }
    print("Squares 1-10:", result)
    print("Sum:", sum(result))
}

# Example 3: Real-world application
fun example_3() {
    print("\nExample 3: Real-world Recursion vs Iteration")
    let items = [{"name":"alpha","val":3},{"name":"beta","val":1},{"name":"gamma","val":2}]
    # Process items
    for item in items {
        print(format("  {0}: {1}", item["name"], item["val"]))
    }
}

example_1()
example_2()
example_3()
print("\nKey takeaways:")
print("  1. Understand the problem constraints")
print("  2. Choose appropriate data structure")
print("  3. Analyze time and space complexity")
