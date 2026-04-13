# String Exercise 14: Roman numeral to integer

fun 14_int_from_roman(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 14_int_from_roman(sample)
print("Output:", output[:50] if len(output)>50 else output)
