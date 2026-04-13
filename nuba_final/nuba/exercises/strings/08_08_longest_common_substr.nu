# String Exercise 08: Longest common substring

fun 08_longest_common_substr(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 08_longest_common_substr(sample)
print("Output:", output[:50] if len(output)>50 else output)
