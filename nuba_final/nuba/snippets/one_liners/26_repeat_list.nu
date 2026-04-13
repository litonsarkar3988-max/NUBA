# One-liner: Repeat list n times

fun repeat_list(lst,n){
    let r=[]
    for i in 0..n { r=r+lst }
    return r
}
print(repeat_list([1,2,3],3))
