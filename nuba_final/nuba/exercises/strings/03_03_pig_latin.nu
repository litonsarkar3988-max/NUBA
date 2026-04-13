# String Exercise: Pig Latin converter

fun to_pig_latin(word) {
    let vowels = "aeiouAEIOU"
    if contains(vowels, substr(word,0,1)) {
        return word + "yay"
    }
    let i = 0
    while i < len(word) and not contains(vowels, substr(word,i,i+1)) { i += 1 }
    return substr(word, i, len(word)) + substr(word, 0, i) + "ay"
}
let words = ["hello","apple","string","eat","omelet"]
for w in words { print(w, "->", to_pig_latin(w)) }
