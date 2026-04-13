# Intermediate: Palindrome Number
fun is_palindrome_num(n) {
    let s = str(n)
    let rev = join(reversed(s.chars()), "")
    return s == rev
}
for n in [121, 123, 12321, 12345, 1001] {
    print(n, "->", is_palindrome_num(n))
}
