# One-liner: Take while predicate

fun take_while(lst,pred){
    let r=[]
    for x in lst { if not pred(x) { break }; push(r,x) }
    return r
}
print(take_while([1,2,3,4,5,6],fun(x)->x<4))
