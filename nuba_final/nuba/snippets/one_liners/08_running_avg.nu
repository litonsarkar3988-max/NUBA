# One-liner: Running average

let nums=[10,20,30,40,50]
let total=0
for i in 0..len(nums) {
    total+=nums[i]
    print("Avg["+str(i+1)+"]:", round(total/(i+1),2))
}
