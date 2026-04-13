# Intermediate: Two Sum Problem
fun two_sum(nums, target) {
    let seen = {}
    for i in 0..len(nums) {
        let comp = target - nums[i]
        if has(seen, comp) { return [seen[comp], i] }
        seen[nums[i]] = i
    }
    return null
}
print(two_sum([2, 7, 11, 15], 9))
print(two_sum([3, 2, 4], 6))
