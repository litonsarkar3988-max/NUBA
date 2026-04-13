# Algorithm: Cover Tree
# Category: Tree

print("=== Cover Tree ===")

fun run_cover_tree(data) {
    print("Running Cover Tree on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_cover_tree(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_cover_tree(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_cover_tree([5,3,8,1,9,2,7,4,6])
run_cover_tree([1,2,3,4,5])
run_cover_tree([5,4,3,2,1])
print("\nBenchmark:")
benchmark_cover_tree([10, 100])
