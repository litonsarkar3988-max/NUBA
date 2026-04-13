# One-liner: Interleave two lists

fun interleave(a,b){
    let r=[]
    for i in 0..min([len(a),len(b)]){ push(r,a[i]); push(r,b[i]) }
    return r
}
print(interleave([1,3,5],[2,4,6]))
