# Beginner Exercise 27: is_palindrome

let s = "racecar"
let chars = s.chars()
let rev = join(reversed(chars), "")
if s == rev {
    print(s, "is a palindrome")
} else {
    print(s, "is not a palindrome")
}
