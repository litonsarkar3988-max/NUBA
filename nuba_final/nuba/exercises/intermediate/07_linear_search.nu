# Intermediate: Linear Search
fun linear_search(arr, target) {
    for i in 0..len(arr) {
        if arr[i] == target { return i }
    }
    return -1
}
print(linear_search([5, 3, 8, 1, 9, 2], 8))
