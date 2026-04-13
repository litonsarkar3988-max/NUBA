# examples/algorithms.nu - Classic algorithms in Nuba

print("=== Sorting Algorithms ===")

fun bubble_sort(arr) {
    let a = arr.copy()
    let n = len(a)
    for i in 0..n {
        for j in 0..(n - i - 1) {
            if a[j] > a[j + 1] {
                let tmp = a[j]
                a[j] = a[j + 1]
                a[j + 1] = tmp
            }
        }
    }
    return a
}

fun merge_sort(arr) {
    if len(arr) <= 1 { return arr }
    let mid   = floor(len(arr) / 2)
    let left  = merge_sort(arr.slice(0, mid))
    let right = merge_sort(arr.slice(mid, len(arr)))
    return merge(left, right)
}

fun merge(left, right) {
    let result = []
    let i = 0
    let j = 0
    while i < len(left) and j < len(right) {
        if left[i] <= right[j] {
            push(result, left[i])
            i += 1
        } else {
            push(result, right[j])
            j += 1
        }
    }
    while i < len(left) {
        push(result, left[i])
        i += 1
    }
    while j < len(right) {
        push(result, right[j])
        j += 1
    }
    return result
}

fun quick_sort(arr) {
    if len(arr) <= 1 { return arr }
    let pivot  = arr[floor(len(arr) / 2)]
    let left   = filter(fun(x) -> x < pivot,  arr)
    let middle = filter(fun(x) -> x == pivot, arr)
    let right  = filter(fun(x) -> x > pivot,  arr)
    return quick_sort(left) + middle + quick_sort(right)
}

let data = [64, 34, 25, 12, 22, 11, 90, 45, 67, 33]
print("Original:", data)
print("Bubble:", bubble_sort(data))
print("Merge:", merge_sort(data))
print("Quick:", quick_sort(data))

print("\n=== Searching ===")

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

let sorted_data = quick_sort(data)
print("Sorted:", sorted_data)
print("Search 25 at index:", binary_search(sorted_data, 25))
print("Search 99 at index:", binary_search(sorted_data, 99))

print("\n=== Graph BFS ===")

fun bfs(graph, start) {
    let visited = []
    let queue   = [start]
    while len(queue) > 0 {
        let node = queue[0]
        remove(queue, node)
        if not visited.contains(node) {
            push(visited, node)
            if has(graph, node) {
                for neighbor in graph[node] {
                    push(queue, neighbor)
                }
            }
        }
    }
    return visited
}

let graph = {
    "A": ["B", "C"],
    "B": ["A", "D", "E"],
    "C": ["A", "F"],
    "D": ["B"],
    "E": ["B", "F"],
    "F": ["C", "E"]
}
print("BFS from A:", bfs(graph, "A"))

print("\n=== Two Sum ===")
fun two_sum(nums, target) {
    let seen = {}
    for i in 0..len(nums) {
        let n = nums[i]
        let complement = target - n
        if has(seen, complement) {
            return [seen[complement], i]
        }
        seen[n] = i
    }
    return null
}
let arr = [2, 7, 11, 15]
print("Two sum([2,7,11,15], 9):", two_sum(arr, 9))

print("\n=== Anagram Check ===")
fun is_anagram(s1, s2) {
    if len(s1) != len(s2) { return false }
    let freq = {}
    for ch in s1.chars() {
        freq[ch] = (freq[ch] if has(freq, ch) else 0) + 1
    }
    for ch in s2.chars() {
        if not has(freq, ch) { return false }
        freq[ch] -= 1
        if freq[ch] < 0 { return false }
    }
    return true
}
print("listen/silent:", is_anagram("listen", "silent"))
print("hello/world:", is_anagram("hello", "world"))
