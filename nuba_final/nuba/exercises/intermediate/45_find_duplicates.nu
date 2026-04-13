# Intermediate: Find All Duplicates in Array
fun find_duplicates(nums) {
    let freq = {}
    let result = []
    for n in nums {
        let k = str(n)
        if has(freq, k) { freq[k] += 1 } else { freq[k] = 1 }
    }
    for pair in items(freq) {
        if pair[1] > 1 { push(result, int(pair[0])) }
    }
    return result
}
print(find_duplicates([4,3,2,7,8,2,3,1]))
