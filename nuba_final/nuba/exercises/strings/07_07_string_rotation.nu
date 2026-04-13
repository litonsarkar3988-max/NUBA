# String Exercise 07: Check if one string is rotation of another

fun 07_string_rotation(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 07_string_rotation(sample)
print("Output:", output[:50] if len(output)>50 else output)
