# Intermediate: 3Sum
fun three_sum(nums) {
    let result = []
    let n = len(nums)
    let sorted_n = sorted(nums)
    for i in 0..n {
        if i > 0 and sorted_n[i] == sorted_n[i-1] { continue }
        let lo = i + 1
        let hi = n - 1
        while lo < hi {
            let s = sorted_n[i] + sorted_n[lo] + sorted_n[hi]
            if s == 0 {
                push(result, [sorted_n[i], sorted_n[lo], sorted_n[hi]])
                while lo < hi and sorted_n[lo] == sorted_n[lo+1] { lo += 1 }
                while lo < hi and sorted_n[hi] == sorted_n[hi-1] { hi -= 1 }
                lo += 1; hi -= 1
            } elif s < 0 { lo += 1 }
            else { hi -= 1 }
        }
    }
    return result
}
print(three_sum([-1,0,1,2,-1,-4]))
