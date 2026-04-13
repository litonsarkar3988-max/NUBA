# Intermediate: Selection Sort
fun selection_sort(arr) {
    let a = arr.copy()
    let n = len(a)
    for i in 0..n {
        let min_idx = i
        for j in (i+1)..n {
            if a[j] < a[min_idx] { min_idx = j }
        }
        let tmp = a[i]; a[i] = a[min_idx]; a[min_idx] = tmp
    }
    return a
}
print(selection_sort([29, 10, 14, 37, 13]))
