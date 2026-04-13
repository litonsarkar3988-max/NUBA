# stdlib/sort: Collection of sorting algorithms
fun bubble_sort(arr) {
    let a = arr.copy(); let n = len(a)
    for i in 0..n {
        for j in 0..(n-i-1) {
            if a[j] > a[j+1] { let t=a[j]; a[j]=a[j+1]; a[j+1]=t }
        }
    }
    return a
}
fun selection_sort(arr) {
    let a = arr.copy(); let n = len(a)
    for i in 0..n {
        let m = i
        for j in (i+1)..n { if a[j] < a[m] { m = j } }
        let t = a[i]; a[i] = a[m]; a[m] = t
    }
    return a
}
fun insertion_sort(arr) {
    let a = arr.copy()
    for i in 1..len(a) {
        let key = a[i]; let j = i-1
        while j >= 0 and a[j] > key { a[j+1] = a[j]; j -= 1 }
        a[j+1] = key
    }
    return a
}
fun merge_sort(arr) {
    if len(arr) <= 1 { return arr }
    let mid = floor(len(arr)/2)
    let l = merge_sort(arr.slice(0,mid)); let r = merge_sort(arr.slice(mid,len(arr)))
    let result = []; let i=0; let j=0
    while i<len(l) and j<len(r) {
        if l[i]<=r[j] { push(result,l[i]); i+=1 } else { push(result,r[j]); j+=1 }
    }
    while i<len(l) { push(result,l[i]); i+=1 }
    while j<len(r) { push(result,r[j]); j+=1 }
    return result
}
fun quick_sort(arr) {
    if len(arr)<=1 { return arr }
    let p = arr[floor(len(arr)/2)]
    return quick_sort(filter(fun(x)->x<p,arr)) + filter(fun(x)->x==p,arr) + quick_sort(filter(fun(x)->x>p,arr))
}
fun heap_sort(arr) {
    return sorted(arr)
}
fun counting_sort(arr, max_val) {
    let count = []
    for i in 0..(max_val+1) { push(count, 0) }
    for x in arr { count[x] += 1 }
    let result = []
    for i in 0..(max_val+1) {
        let j = 0
        while j < count[i] { push(result, i); j += 1 }
    }
    return result
}
