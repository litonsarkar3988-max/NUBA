# Intermediate: Longest Palindromic Substring
fun longest_palindrome(s) {
    let n = len(s)
    let chars = s.chars()
    let best = chars[0]
    fun expand(lo, hi) {
        while lo >= 0 and hi < n and chars[lo] == chars[hi] {
            if hi - lo + 1 > len(best) {
                best = join(chars.slice(lo, hi+1), "")
            }
            lo -= 1; hi += 1
        }
    }
    for i in 0..n {
        expand(i, i)
        if i+1 < n { expand(i, i+1) }
    }
    return best
}
print(longest_palindrome("babad"))
print(longest_palindrome("cbbd"))
print(longest_palindrome("racecar"))
