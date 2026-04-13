# One-liner: Cartesian product

fun cart(a,b){
    let r=[]
    for x in a { for y in b { push(r,[x,y]) } }
    return r
}
print(cart([1,2],["a","b","c"]))
