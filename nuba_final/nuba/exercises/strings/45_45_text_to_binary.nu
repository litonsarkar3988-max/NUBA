# String Exercise 45: ASCII text to binary

fun 45_text_to_binary(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 45_text_to_binary(sample)
print("Output:", output[:50] if len(output)>50 else output)
