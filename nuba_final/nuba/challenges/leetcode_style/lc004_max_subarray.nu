# LeetCode Style: Maximum Subarray (Kadane)

fun max_sub(nums){
    let best=nums[0]; let cur=nums[0]
    for i in 1..len(nums) {
        cur=max([nums[i],cur+nums[i]])
        if cur>best { best=cur }
    }
    return best
}
print(max_sub([-2,1,-3,4,-1,2,1,-5,4]))
