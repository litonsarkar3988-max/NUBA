# Intermediate: Word Frequency Counter
let text = "the quick brown fox jumps over the lazy dog the fox"
let words = split(text, " ")
let freq = {}
for word in words {
    if has(freq, word) { freq[word] += 1 }
    else { freq[word] = 1 }
}
print("Word Frequencies:")
for pair in items(freq) {
    print(" ", pair[0], ":", pair[1])
}
