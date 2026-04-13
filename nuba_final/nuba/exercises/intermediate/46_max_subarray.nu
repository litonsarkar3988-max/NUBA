# Intermediate: Maximum Subarray (Kadane's)
fun max_subarray(nums) {
    let max_sum = nums[0]
    let curr    = nums[0]
    for i in 1..len(nums) {
        curr = max([nums[i], curr + nums[i]])
        if curr > max_sum { max_sum = curr }
    }
    return max_sum
}
print(max_subarray([-2,1,-3,4,-1,2,1,-5,4]))
print(max_subarray([1]))
print(max_subarray([5,4,-1,7,8]))
