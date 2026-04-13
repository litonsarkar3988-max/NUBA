# One-liner: Chunk list into groups

fun chunk(lst,n){
    let r=[]; let i=0
    while i<len(lst){ push(r,lst.slice(i,i+n)); i+=n }
    return r
}
print(chunk([1,2,3,4,5,6,7],3))
