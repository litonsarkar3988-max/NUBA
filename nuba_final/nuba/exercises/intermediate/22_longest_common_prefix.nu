# Intermediate: Longest Common Prefix
fun lcp(strs) {
    if len(strs) == 0 { return "" }
    let prefix = strs[0]
    for i in 1..len(strs) {
        while not startswith(strs[i], prefix) {
            prefix = substr(prefix, 0, len(prefix) - 1)
            if prefix == "" { return "" }
        }
    }
    return prefix
}
print(lcp(["flower","flow","flight"]))
print(lcp(["dog","racecar","car"]))
