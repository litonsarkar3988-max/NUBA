# Intermediate: Valid Palindrome (alphanumeric only)
fun is_alnum_char(ch) {
    let c = ord(ch)
    return (c>=48 and c<=57) or (c>=65 and c<=90) or (c>=97 and c<=122)
}
fun valid_palindrome(s) {
    let filtered = filter(fun(ch) -> is_alnum_char(ch), s.chars())
    let lower_s  = map(fun(ch) -> lower(ch), filtered)
    return join(lower_s,"") == join(reversed(lower_s),"")
}
print(valid_palindrome("A man, a plan, a canal: Panama"))
print(valid_palindrome("race a car"))
