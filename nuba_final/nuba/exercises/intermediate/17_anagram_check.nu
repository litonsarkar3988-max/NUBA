# Intermediate: Anagram Check
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
print(is_anagram("listen", "silent"))
print(is_anagram("hello", "world"))
print(is_anagram("triangle", "integral"))
