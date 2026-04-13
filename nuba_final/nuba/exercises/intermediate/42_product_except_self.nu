# Intermediate: Product of Array Except Self
fun product_except_self(nums) {
    let n = len(nums)
    let result = []
    for i in 0..n { push(result, 1) }
    let left = 1
    for i in 0..n { result[i] = left; left *= nums[i] }
    let right = 1
    let i = n - 1
    while i >= 0 { result[i] *= right; right *= nums[i]; i -= 1 }
    return result
}
print(product_except_self([1,2,3,4]))
print(product_except_self([-1,1,0,-3,3]))
