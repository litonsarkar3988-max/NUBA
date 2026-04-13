# String Exercise 16: CamelCase to snake_case

fun 16_camel_snake_convert(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 16_camel_snake_convert(sample)
print("Output:", output[:50] if len(output)>50 else output)
