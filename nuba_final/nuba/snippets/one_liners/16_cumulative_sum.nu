# One-liner: Cumulative sum

fun cumsum(lst){
    let r=[]; let s=0
    for x in lst { s+=x; push(r,s) }
    return r
}
print(cumsum([1,2,3,4,5]))
