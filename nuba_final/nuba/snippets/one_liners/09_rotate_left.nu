# One-liner: Rotate list left by k

fun rot_l(lst,k){ let n=len(lst); k=k%n; return lst.slice(k,n)+lst.slice(0,k) }
print(rot_l([1,2,3,4,5],2))
