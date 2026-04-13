# Utility: Normalize list to 0-1 range

fun normalize(lst){
    let mn=min(lst); let mx=max(lst); let r=mx-mn
    if r==0 { return map(fun(x)->0.0,lst) }
    return map(fun(x)->round((x-mn)/r,4),lst)
}
print(normalize([2,4,6,8,10]))
