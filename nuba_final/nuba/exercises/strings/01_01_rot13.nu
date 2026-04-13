# String Exercise: ROT13 encoding

fun rot13(s) {
    let result = ""
    for ch in s.chars() {
        let c = ord(ch)
        if c>=65 and c<=90 { result += char((c-65+13)%26+65) }
        elif c>=97 and c<=122 { result += char((c-97+13)%26+97) }
        else { result += ch }
    }
    return result
}
print(rot13("Hello World"))
print(rot13(rot13("Hello World")))
