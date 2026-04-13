# LeetCode Style: Two Sum

fun two_sum(nums,target){
    let seen={}
    for i in 0..len(nums) {
        let c=target-nums[i]
        if has(seen,c) { return [seen[c],i] }
        seen[nums[i]]=i
    }
    return []
}
print(two_sum([2,7,11,15],9))
print(two_sum([3,2,4],6))
