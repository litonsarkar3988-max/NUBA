# String Exercise 11: All permutations of a string

fun 11_string_permutations(text) {
    print("Processing:", text[:20] if len(text)>20 else text)
    let chars = text.chars()
    let result = ""
    for ch in chars { result += ch }
    return result
}

# Test
let sample = "Hello, Nuba Programming Language!"
let output = 11_string_permutations(sample)
print("Output:", output[:50] if len(output)>50 else output)
