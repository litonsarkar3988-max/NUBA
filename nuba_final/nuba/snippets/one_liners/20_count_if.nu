# One-liner: Count elements by predicate

fun count_if(lst,pred){ return len(filter(pred,lst)) }
print(count_if([1,2,3,4,5,6,7,8],fun(x)->x%2==0))
