# Intermediate: String Compression
fun compress(s) {
    if len(s) == 0 { return "" }
    let chars = s.chars()
    let result = ""
    let count = 1
    for i in 1..len(chars) {
        if chars[i] == chars[i-1] { count += 1 }
        else {
            result += chars[i-1]
            if count > 1 { result += str(count) }
            count = 1
        }
    }
    result += chars[len(chars)-1]
    if count > 1 { result += str(count) }
    if len(result) >= len(s) { return s }
    return result
}
print(compress("aabcccccaaa"))
print(compress("abcdef"))
