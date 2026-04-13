# One-liner: Partition by predicate

fun partition(lst,pred){
    return [filter(pred,lst), filter(fun(x)->not pred(x),lst)]
}
let parts = partition([1,2,3,4,5,6], fun(x)->x%2==0)
print("Even:",parts[0],"Odd:",parts[1])
