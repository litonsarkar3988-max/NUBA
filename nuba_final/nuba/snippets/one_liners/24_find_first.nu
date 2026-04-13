# One-liner: Find first match

fun find_first(lst,pred){
    for x in lst { if pred(x) { return x } }
    return null
}
print(find_first([1,4,3,8,2],fun(x)->x>5))
