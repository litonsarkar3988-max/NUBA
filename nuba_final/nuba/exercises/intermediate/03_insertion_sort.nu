# Intermediate: Insertion Sort
fun insertion_sort(arr) {
    let a = arr.copy()
    for i in 1..len(a) {
        let key = a[i]
        let j = i - 1
        while j >= 0 and a[j] > key {
            a[j+1] = a[j]
            j -= 1
        }
        a[j+1] = key
    }
    return a
}
print(insertion_sort([12, 11, 13, 5, 6]))
