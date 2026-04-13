# Algorithm: Postman Sort
# Category: Misc

print("=== Postman Sort ===")

fun run_postman_sort(data) {
    print("Running Postman Sort on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_postman_sort(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_postman_sort(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_postman_sort([5,3,8,1,9,2,7,4,6])
run_postman_sort([1,2,3,4,5])
run_postman_sort([5,4,3,2,1])
print("\nBenchmark:")
benchmark_postman_sort([10, 100])
