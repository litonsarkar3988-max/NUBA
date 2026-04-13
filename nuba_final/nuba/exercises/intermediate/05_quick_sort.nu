# Intermediate: Quick Sort
fun quick_sort(arr) {
    if len(arr) <= 1 { return arr }
    let pivot = arr[floor(len(arr)/2)]
    let left   = filter(fun(x) -> x < pivot,  arr)
    let middle = filter(fun(x) -> x == pivot, arr)
    let right  = filter(fun(x) -> x > pivot,  arr)
    return quick_sort(left) + middle + quick_sort(right)
}
print(quick_sort([10, 7, 8, 9, 1, 5]))
