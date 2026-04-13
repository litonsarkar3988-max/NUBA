# Daily Challenge 9: Find longest consecutive sequence

fun longest_consec(nums){
    let s={}
    for n in nums { s[str(n)]=true }
    let best=0
    for n in nums {
        if not has(s,str(n-1)) {
            let cur=n; let streak=1
            while has(s,str(cur+1)) { cur+=1; streak+=1 }
            if streak>best { best=streak }
        }
    }
    return best
}
print(longest_consec([100,4,200,1,3,2]))
print(longest_consec([0,3,7,2,5,8,4,6,0,1]))
