# Intermediate: Majority Element (Boyer-Moore)
fun majority_element(nums) {
    let candidate = nums[0]
    let count = 1
    for i in 1..len(nums) {
        if count == 0 { candidate = nums[i]; count = 1 }
        elif nums[i] == candidate { count += 1 }
        else { count -= 1 }
    }
    return candidate
}
print(majority_element([3,2,3]))
print(majority_element([2,2,1,1,1,2,2]))
