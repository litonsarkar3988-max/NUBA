# One-liner: Frequency map

fun freq(lst){
    let d={}
    for x in lst {
        let k=str(x)
        if has(d,k){ d[k]+=1 } else { d[k]=1 }
    }
    return d
}
print(freq([1,2,2,3,3,3,4]))
