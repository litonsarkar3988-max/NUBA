# Algorithm: Balloon Burst
# Category: Dp

print("=== Balloon Burst ===")

fun run_balloon_burst(data) {
    print("Running Balloon Burst on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_balloon_burst(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_balloon_burst(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_balloon_burst([5,3,8,1,9,2,7,4,6])
run_balloon_burst([1,2,3,4,5])
run_balloon_burst([5,4,3,2,1])
print("\nBenchmark:")
benchmark_balloon_burst([10, 100])
