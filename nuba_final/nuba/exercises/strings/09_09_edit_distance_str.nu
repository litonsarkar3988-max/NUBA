# String Exercise 09: Edit distance between strings

fun 09_edit_distance_str(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 09_edit_distance_str(sample)
print("Output:", output[:50] if len(output)>50 else output)
