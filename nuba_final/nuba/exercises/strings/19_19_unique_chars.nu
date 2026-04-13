# String Exercise 19: Check for unique characters

fun 19_unique_chars(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 19_unique_chars(sample)
print("Output:", output[:50] if len(output)>50 else output)
