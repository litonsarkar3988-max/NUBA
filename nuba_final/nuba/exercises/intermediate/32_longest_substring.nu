# Intermediate: Longest Substring Without Repeating
fun length_of_longest(s) {
    let seen = {}
    let start = 0
    let max_len = 0
    let chars = s.chars()
    for i in 0..len(chars) {
        let ch = chars[i]
        if has(seen, ch) and seen[ch] >= start {
            start = seen[ch] + 1
        }
        seen[ch] = i
        if i - start + 1 > max_len { max_len = i - start + 1 }
    }
    return max_len
}
print(length_of_longest("abcabcbb"))
print(length_of_longest("bbbbb"))
print(length_of_longest("pwwkew"))
