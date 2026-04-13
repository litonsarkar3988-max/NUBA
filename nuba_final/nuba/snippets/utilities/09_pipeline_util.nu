# Utility: Pipeline utility function

fun pipeline(val,fns){
    for fn in fns { val=fn(val) }
    return val
}
let result=pipeline(5,[
    fun(x)->x*2,
    fun(x)->x+10,
    fun(x)->x*x,
    fun(x)->round(sqrt(x),2)
])
print(result)
