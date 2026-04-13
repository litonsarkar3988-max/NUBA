# Beginner Exercise 26: count_vowels

let s = "Hello Nuba Language"
let vowels = ["a","e","i","o","u","A","E","I","O","U"]
let count = 0
for ch in s.chars() {
    if vowels.contains(ch) { count += 1 }
}
print("Vowels:", count)
