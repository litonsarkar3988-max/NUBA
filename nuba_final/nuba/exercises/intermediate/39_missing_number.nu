# Intermediate: Find Missing Number
fun missing_number(nums) {
    let n = len(nums)
    let expected = n * (n+1) / 2
    return expected - sum(nums)
}
print(missing_number([3,0,1]))
print(missing_number([0,1]))
print(missing_number([9,6,4,2,3,5,7,0,1]))
