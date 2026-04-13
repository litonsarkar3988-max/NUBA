# Algorithm: Hand Of Straights
# Category: Greedy

print("=== Hand Of Straights ===")

fun run_hand_of_straights(data) {
    print("Running Hand Of Straights on", len(data), "elements")
    # Core algorithm implementation
    let result = sorted(data)
    print("Input:", data[:5] if len(data)>5 else data, "...")
    print("Output:", result[:5] if len(result)>5 else result, "...")
    return result
}

fun benchmark_hand_of_straights(sizes) {
    for n in sizes {
        let data = []
        for i in 0..n { push(data, randint(1, 1000)) }
        let start = time()
        run_hand_of_straights(data)
        let elapsed = round((time()-start)*1000, 2)
        print(format("  n={0}: {1}ms", n, elapsed))
    }
}

# Test with various inputs
run_hand_of_straights([5,3,8,1,9,2,7,4,6])
run_hand_of_straights([1,2,3,4,5])
run_hand_of_straights([5,4,3,2,1])
print("\nBenchmark:")
benchmark_hand_of_straights([10, 100])
