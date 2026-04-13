# String Exercise 28: String diff (LCS-based)

fun 28_diff_strings(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 28_diff_strings(sample)
print("Output:", output[:50] if len(output)>50 else output)
