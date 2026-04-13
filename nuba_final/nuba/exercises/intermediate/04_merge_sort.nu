# Intermediate: Merge Sort
fun merge(left, right) {
    let result = []
    let i = 0
    let j = 0
    while i < len(left) and j < len(right) {
        if left[i] <= right[j] { push(result, left[i]); i += 1 }
        else { push(result, right[j]); j += 1 }
    }
    while i < len(left)  { push(result, left[i]);  i += 1 }
    while j < len(right) { push(result, right[j]); j += 1 }
    return result
}
fun merge_sort(arr) {
    if len(arr) <= 1 { return arr }
    let mid = floor(len(arr) / 2)
    return merge(merge_sort(arr.slice(0, mid)), merge_sort(arr.slice(mid, len(arr))))
}
print(merge_sort([38, 27, 43, 3, 9, 82, 10]))
