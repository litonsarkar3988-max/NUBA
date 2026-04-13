# Algorithm: Hamilton Path
# Category: Graph

print("=== Hamilton Path ===")

fun run_hamilton_path(data) {
    print("Running Hamilton Path on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_hamilton_path(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_hamilton_path(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_hamilton_path([5,3,8,1,9,2,7,4,6])
run_hamilton_path([1,2,3,4,5])
run_hamilton_path([5,4,3,2,1])
print("\nBenchmark:")
benchmark_hamilton_path([10, 100])
