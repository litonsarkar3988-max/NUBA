# Intermediate: Bubble Sort
fun bubble_sort(arr) {
    let a = arr.copy()
    let n = len(a)
    for i in 0..n {
        for j in 0..(n - i - 1) {
            if a[j] > a[j+1] {
                let tmp = a[j]; a[j] = a[j+1]; a[j+1] = tmp
            }
        }
    }
    return a
}
print(bubble_sort([64, 34, 25, 12, 22, 11, 90]))
