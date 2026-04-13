# String Exercise: Text statistics analyzer

fun analyze(text) {
    let words = split(trim(text), " ")
    let chars  = text.chars()
    let vowels = "aeiouAEIOU"
    let vowel_count = len(filter(fun(c) -> contains(vowels, c), chars))
    let word_lengths = map(fun(w) -> len(w), words)
    let avg_word_len = sum(word_lengths) / len(word_lengths)
    print("Characters:", len(chars))
    print("Words:", len(words))
    print("Vowels:", vowel_count)
    print("Avg word length:", round(avg_word_len, 2))
    print("Longest word:", max(word_lengths))
    print("Shortest word:", min(word_lengths))
}
analyze("The quick brown fox jumps over the lazy dog")
