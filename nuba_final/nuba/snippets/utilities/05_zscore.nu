# Utility: Calculate z-scores

fun mean(lst){ return sum(lst)/len(lst) }
fun std_dev(lst){
    let m=mean(lst)
    return sqrt(sum(map(fun(x)->(x-m)*(x-m),lst))/len(lst))
}
fun zscores(lst){
    let m=mean(lst); let s=std_dev(lst)
    return map(fun(x)->round((x-m)/s,3),lst)
}
print(zscores([2,4,4,4,5,5,7,9]))
