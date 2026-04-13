# Intermediate: Move Zeros to End
fun move_zeros(nums) {
    let result = filter(fun(x) -> x != 0, nums)
    let zeros  = filter(fun(x) -> x == 0, nums)
    return result + zeros
}
print(move_zeros([0,1,0,3,12]))
print(move_zeros([0,0,1]))
