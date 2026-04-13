# String Exercise 18: Reverse each word in sentence

fun 18_sentence_reverse(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 18_sentence_reverse(sample)
print("Output:", output[:50] if len(output)>50 else output)
