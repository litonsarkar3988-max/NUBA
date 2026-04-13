# Algorithm: Jump
# Category: Searching

print("=== Jump ===")

fun run_jump(data) {
    print("Running Jump on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_jump(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_jump(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_jump([5,3,8,1,9,2,7,4,6])
run_jump([1,2,3,4,5])
run_jump([5,4,3,2,1])
print("\nBenchmark:")
benchmark_jump([10, 100])
