# One-liner: Count occurrences

fun count_occ(lst,val){
    return len(filter(fun(x)->x==val,lst))
}
print(count_occ([1,2,3,2,1,2,4],2))
