# Intermediate: Character Frequency
fun char_freq(s) {
    let freq = {}
    for ch in s.chars() {
        if has(freq, ch) { freq[ch] += 1 }
        else { freq[ch] = 1 }
    }
    return freq
}
let freq = char_freq("programming")
for pair in items(freq) {
    print(pair[0], ":", pair[1])
}
