# One-liner: Check all unique

fun all_unique(lst){
    let s={}
    for x in lst {
        if has(s,str(x)){ return false }
        s[str(x)]=true
    }
    return true
}
print(all_unique([1,2,3,4,5]))
print(all_unique([1,2,2,3]))
