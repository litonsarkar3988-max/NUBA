# One-liner: Dot product of vectors

fun dot(a,b){ return sum(map(fun(p)->p[0]*p[1], zip(a,b))) }
print(dot([1,2,3],[4,5,6]))
