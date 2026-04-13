# Challenge: Count Vowels
fun count_vowels(s) {
    let vowels = "aeiouAEIOU"
    return len(filter(fun(ch) -> contains(vowels, ch), s.chars()))
}
print(count_vowels("Hello World"))
print(count_vowels("Nuba Programming"))
