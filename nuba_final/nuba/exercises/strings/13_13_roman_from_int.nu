# String Exercise 13: Integer to Roman numeral

fun 13_roman_from_int(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 13_roman_from_int(sample)
print("Output:", output[:50] if len(output)>50 else output)
