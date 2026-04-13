# One-liner: Deep flatten

fun flatten_deep(lst){
    let r=[]
    for x in lst {
        if isList(x) { for y in flatten_deep(x) { push(r,y) } }
        else { push(r,x) }
    }
    return r
}
print(flatten_deep([1,[2,[3,[4]]],5]))
