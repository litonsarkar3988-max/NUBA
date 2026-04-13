# LeetCode Style: Container With Most Water

fun max_water(heights){
    let lo=0; let hi=len(heights)-1; let best=0
    while lo<hi {
        let water=(hi-lo)*min([heights[lo],heights[hi]])
        if water>best { best=water }
        if heights[lo]<heights[hi] { lo+=1 } else { hi-=1 }
    }
    return best
}
print(max_water([1,8,6,2,5,4,8,3,7]))
