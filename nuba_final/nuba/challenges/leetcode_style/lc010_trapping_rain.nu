# LeetCode Style: Trapping Rain Water

fun trap_water(heights){
    let n=len(heights)
    let left_max=[]; let right_max=[]
    push(left_max,heights[0])
    for i in 1..n { push(left_max,max([left_max[i-1],heights[i]])) }
    push(right_max,heights[n-1])
    let i=n-2
    while i>=0 { push(right_max,max([right_max[len(right_max)-1],heights[i]])); i-=1 }
    right_max=reversed(right_max)
    let water=0
    for i in 0..n { water+=min([left_max[i],right_max[i]])-heights[i] }
    return water
}
print(trap_water([0,1,0,2,1,0,1,3,2,1,2,1]))
