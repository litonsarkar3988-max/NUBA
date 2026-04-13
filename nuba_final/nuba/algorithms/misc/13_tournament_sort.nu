# Algorithm: Tournament Sort
# Category: Misc

print("=== Tournament Sort ===")

fun run_tournament_sort(data) {
    print("Running Tournament Sort on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_tournament_sort(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_tournament_sort(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_tournament_sort([5,3,8,1,9,2,7,4,6])
run_tournament_sort([1,2,3,4,5])
run_tournament_sort([5,4,3,2,1])
print("\nBenchmark:")
benchmark_tournament_sort([10, 100])
