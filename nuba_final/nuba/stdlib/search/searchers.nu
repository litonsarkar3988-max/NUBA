# stdlib/search: Search algorithms
fun linear_search(arr, target) {
    for i in 0..len(arr) {
        if arr[i] == target { return i }
    }
    return -1
}
fun binary_search(arr, target) {
    let lo=0; let hi=len(arr)-1
    while lo<=hi {
        let mid=floor((lo+hi)/2)
        if arr[mid]==target { return mid }
        elif arr[mid]<target { lo=mid+1 }
        else { hi=mid-1 }
    }
    return -1
}
fun interpolation_search(arr, target) {
    let lo=0; let hi=len(arr)-1
    while lo<=hi and target>=arr[lo] and target<=arr[hi] {
        if lo==hi {
            if arr[lo]==target { return lo }
            return -1
        }
        let pos = lo + floor((hi-lo) * (target-arr[lo]) / (arr[hi]-arr[lo]))
        if arr[pos]==target { return pos }
        elif arr[pos]<target { lo=pos+1 }
        else { hi=pos-1 }
    }
    return -1
}
fun jump_search(arr, target) {
    let n=len(arr); let step=floor(sqrt(n))
    let prev=0
    while arr[min([step,n])-1] < target {
        prev=step; step+=floor(sqrt(n))
        if prev>=n { return -1 }
    }
    while arr[prev] < target {
        prev+=1
        if prev==min([step,n]) { return -1 }
    }
    if arr[prev]==target { return prev }
    return -1
}
fun find_all(arr, target) {
    let result = []
    for i in 0..len(arr) { if arr[i]==target { push(result,i) } }
    return result
}
fun search_in_rotated(arr, target) {
    let lo=0; let hi=len(arr)-1
    while lo<=hi {
        let mid=floor((lo+hi)/2)
        if arr[mid]==target { return mid }
        if arr[lo]<=arr[mid] {
            if arr[lo]<=target and target<arr[mid] { hi=mid-1 }
            else { lo=mid+1 }
        } else {
            if arr[mid]<target and target<=arr[hi] { lo=mid+1 }
            else { hi=mid-1 }
        }
    }
    return -1
}
