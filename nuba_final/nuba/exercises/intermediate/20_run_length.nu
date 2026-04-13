# Intermediate: Run-Length Encoding
fun rle_encode(s) {
    if len(s) == 0 { return "" }
    let result = ""
    let count = 1
    let chars = s.chars()
    for i in 1..len(chars) {
        if chars[i] == chars[i-1] { count += 1 }
        else {
            result += str(count) + chars[i-1]
            count = 1
        }
    }
    result += str(count) + chars[len(chars)-1]
    return result
}
print(rle_encode("AAABBBCCDDDDEE"))
print(rle_encode("ABCD"))
