# One-liner: Drop while predicate

fun drop_while(lst,pred){
    let i=0
    while i<len(lst) and pred(lst[i]) { i+=1 }
    return lst.slice(i,len(lst))
}
print(drop_while([1,2,3,4,5],fun(x)->x<3))
