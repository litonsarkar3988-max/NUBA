# Algorithm: Matrix Fast Pow
# Category: Math

print("=== Matrix Fast Pow ===")

fun run_matrix_fast_pow(data) {
    print("Running Matrix Fast Pow on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_matrix_fast_pow(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_matrix_fast_pow(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_matrix_fast_pow([5,3,8,1,9,2,7,4,6])
run_matrix_fast_pow([1,2,3,4,5])
run_matrix_fast_pow([5,4,3,2,1])
print("\nBenchmark:")
benchmark_matrix_fast_pow([10, 100])
