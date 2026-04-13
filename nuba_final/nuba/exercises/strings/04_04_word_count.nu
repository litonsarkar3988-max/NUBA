# String Exercise: Word frequency counter

fun word_count(text) {
    let words = split(lower(trim(text)), " ")
    let freq = {}
    for w in words {
        let clean = trim(w)
        if len(clean) > 0 {
            if has(freq, clean) { freq[clean] += 1 } else { freq[clean] = 1 }
        }
    }
    return freq
}
let text = "to be or not to be that is the question to be"
let freq = word_count(text)
let sorted_pairs = []
for pair in items(freq) { push(sorted_pairs, [pair[1], pair[0]]) }
sorted_pairs = sorted(sorted_pairs, true)
for p in sorted_pairs { print(p[1], ":", p[0]) }
