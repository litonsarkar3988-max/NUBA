# Utility: Calculate percentile

fun percentile(lst,p){
    let s=sorted(lst)
    let idx=floor(p/100*(len(s)-1))
    return s[idx]
}
let data=[5,1,8,3,9,2,7,4,6,10]
print("P25:",percentile(data,25))
print("P50:",percentile(data,50))
print("P75:",percentile(data,75))
