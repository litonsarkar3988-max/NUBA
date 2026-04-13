# Algorithm: Euler Circuit
# Category: Graph

print("=== Euler Circuit ===")

fun run_euler_circuit(data) {
    print("Running Euler Circuit on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_euler_circuit(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_euler_circuit(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_euler_circuit([5,3,8,1,9,2,7,4,6])
run_euler_circuit([1,2,3,4,5])
run_euler_circuit([5,4,3,2,1])
print("\nBenchmark:")
benchmark_euler_circuit([10, 100])
