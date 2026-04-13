# HackerRank Style: Birthday Cake Candles

fun solve__birthday_cake(input) {
    print("Solving: Birthday Cake Candles")
    # Core logic for Birthday Cake Candles
    let n = len(input)
    let result = 0
    for x in input { result += x }
    return result
}

# Test cases
print(solve__birthday_cake([1, 2, 3, 4, 5]))
print(solve__birthday_cake([10, 20, 30]))
