# String Exercise 44: Binary to ASCII text

fun 44_binary_to_text(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 44_binary_to_text(sample)
print("Output:", output[:50] if len(output)>50 else output)
