# Intermediate: Rotate Array
fun rotate(arr, k) {
    let n = len(arr)
    k = k % n
    return arr.slice(n-k, n) + arr.slice(0, n-k)
}
print(rotate([1,2,3,4,5,6,7], 3))
print(rotate([1,2,3], 4))
