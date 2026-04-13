# Challenge: Reverse a String
fun reverse_str(s) {
    return join(reversed(s.chars()), "")
}
print(reverse_str("Hello, Nuba!"))
print(reverse_str("abcde"))
