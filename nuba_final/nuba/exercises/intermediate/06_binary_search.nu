# Intermediate: Binary Search
fun binary_search(arr, target) {
    let lo = 0
    let hi = len(arr) - 1
    while lo <= hi {
        let mid = floor((lo + hi) / 2)
        if arr[mid] == target { return mid }
        elif arr[mid] < target { lo = mid + 1 }
        else { hi = mid - 1 }
    }
    return -1
}
let arr = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]
print("Found at index:", binary_search(arr, 13))
print("Not found:", binary_search(arr, 4))
