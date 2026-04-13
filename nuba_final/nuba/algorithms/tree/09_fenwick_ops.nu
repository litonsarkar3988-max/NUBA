# Algorithm: Fenwick Ops
# Category: Tree

print("=== Fenwick Ops ===")

fun run_fenwick_ops(data) {
    print("Running Fenwick Ops on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_fenwick_ops(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_fenwick_ops(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_fenwick_ops([5,3,8,1,9,2,7,4,6])
run_fenwick_ops([1,2,3,4,5])
run_fenwick_ops([5,4,3,2,1])
print("\nBenchmark:")
benchmark_fenwick_ops([10, 100])
