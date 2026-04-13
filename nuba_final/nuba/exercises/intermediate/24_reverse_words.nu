# Intermediate: Reverse Words in String
fun reverse_words(sentence) {
    let words = split(trim(sentence), " ")
    return join(reversed(words), " ")
}
print(reverse_words("Hello World Nuba"))
print(reverse_words("The quick brown fox"))
