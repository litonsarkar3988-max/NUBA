# Daily Challenge 6: Find all pairs with given sum

fun pairs_sum(lst,target){
    let seen={}; let result=[]
    for n in lst {
        let comp=target-n
        if has(seen,comp) { push(result,[comp,n]) }
        seen[n]=true
    }
    return result
}
print(pairs_sum([1,2,3,4,5,6],7))
