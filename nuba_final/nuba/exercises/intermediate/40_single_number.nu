# Intermediate: Single Number (XOR)
fun single_number(nums) {
    # XOR all numbers - duplicates cancel out
    let result = 0
    for n in nums { result = result ^ n }
    return result
}
# Note: Nuba uses ^ for power not XOR, so we implement differently
fun single_num(nums) {
    let freq = {}
    for n in nums {
        let k = str(n)
        if has(freq, k) { freq[k] += 1 } else { freq[k] = 1 }
    }
    for pair in items(freq) {
        if pair[1] == 1 { return int(pair[0]) }
    }
    return null
}
print(single_num([2,2,1]))
print(single_num([4,1,2,1,2]))
