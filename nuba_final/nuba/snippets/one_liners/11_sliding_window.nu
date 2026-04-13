# One-liner: Sliding window sum

fun window_sum(lst,k){
    let r=[]
    for i in 0..(len(lst)-k+1){ push(r,sum(lst.slice(i,i+k))) }
    return r
}
print(window_sum([1,2,3,4,5],3))
