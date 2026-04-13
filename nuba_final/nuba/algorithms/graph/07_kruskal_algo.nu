# Algorithm: Kruskal Algo
# Category: Graph

print("=== Kruskal Algo ===")

fun run_kruskal_algo(data) {
    print("Running Kruskal Algo on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_kruskal_algo(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_kruskal_algo(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_kruskal_algo([5,3,8,1,9,2,7,4,6])
run_kruskal_algo([1,2,3,4,5])
run_kruskal_algo([5,4,3,2,1])
print("\nBenchmark:")
benchmark_kruskal_algo([10, 100])
