# LeetCode Style: Merge Intervals

fun merge_intervals(intervals){
    if len(intervals)==0 { return [] }
    let sorted_i=sorted(intervals)
    let result=[sorted_i[0]]
    for i in 1..len(sorted_i) {
        let last=result[len(result)-1]
        if sorted_i[i][0]<=last[1] {
            result[len(result)-1]=[last[0],max([last[1],sorted_i[i][1]])]
        } else {
            push(result,sorted_i[i])
        }
    }
    return result
}
print(merge_intervals([[1,3],[2,6],[8,10],[15,18]]))
