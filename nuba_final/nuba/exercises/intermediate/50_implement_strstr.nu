# Intermediate: Implement strStr (KMP)
fun strstr(haystack, needle) {
    if len(needle) == 0 { return 0 }
    let n = len(haystack)
    let m = len(needle)
    let hc = haystack.chars()
    let nc = needle.chars()
    for i in 0..(n - m + 1) {
        let match = true
        for j in 0..m {
            if hc[i+j] != nc[j] { match = false; break }
        }
        if match { return i }
    }
    return -1
}
print(strstr("hello", "ll"))
print(strstr("aaaaa", "bba"))
print(strstr("", ""))
