# examples/strings.nu - String operations in Nuba

let s = "Hello, Nuba World!"
print("String:", s)
print("Length:", len(s))
print("Upper:", upper(s))
print("Lower:", lower(s))

# Trim
let padded = "   spaces around   "
print("Trimmed:", trim(padded))

# Split / Join
let csv = "apple,banana,cherry,date"
let fruits = split(csv, ",")
print("Split:", fruits)
print("Joined:", join(fruits, " | "))

# Contains / startsWith / endsWith
print("Contains 'Nuba':", contains(s, "Nuba"))
print("Starts with 'Hello':", startswith(s, "Hello"))
print("Ends with '!':", endswith(s, "!"))

# Replace
let new_s = replace(s, "Nuba", "World")
print("Replaced:", new_s)

# Substring
print("Substr [0,5]:", substr(s, 0, 5))
print("Substr [7,11]:", substr(s, 7, 11))

# IndexOf
print("Index of 'Nuba':", indexOf(s, "Nuba"))

# Method chaining equivalent
let result = trim(lower(replace("  HELLO WORLD  ", "WORLD", "NUBA")))
print("Chained:", result)

# String methods on instances
let word = "Nuba"
print("word.upper():", word.upper())
print("word.lower():", word.lower())
print("word.contains('ub'):", word.contains("ub"))
print("word.repeat(3):", word.repeat(3))
print("word.chars():", word.chars())

# char and ord
print("char(65):", char(65))
print("ord('A'):", ord("A"))

# Format strings
let name = "Developer"
let version = 1
print(format("Welcome, {0}! You are using Nuba v{1}.0", name, version))

# String as list of chars
let letters = "abcdef"
print("Third letter:", substr(letters, 2, 3))

# Build string with loop
let built = ""
for i in 1..6 {
    built += str(i)
    if i < 5 { built += "-" }
}
print("Built:", built)

# Multi-line string simulation
let lines = ["Line 1: Hello", "Line 2: World", "Line 3: Nuba"]
let doc = join(lines, "\n")
print("Document:\n" + doc)

# Palindrome check
fun is_palindrome(word) {
    let chars = word.lower().chars()
    let reversed_chars = reversed(chars)
    return join(chars, "") == join(reversed_chars, "")
}
let words = ["racecar", "hello", "level", "world", "noon"]
for w in words {
    print(w, "is palindrome:", is_palindrome(w))
}
