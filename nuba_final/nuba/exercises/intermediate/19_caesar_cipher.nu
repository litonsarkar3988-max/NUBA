# Intermediate: Caesar Cipher
fun caesar_encrypt(text, shift) {
    let result = ""
    for ch in text.chars() {
        let c = ord(ch)
        if c >= 65 and c <= 90 {
            result += char((c - 65 + shift) % 26 + 65)
        } elif c >= 97 and c <= 122 {
            result += char((c - 97 + shift) % 26 + 97)
        } else {
            result += ch
        }
    }
    return result
}
fun caesar_decrypt(text, shift) { return caesar_encrypt(text, 26 - shift) }
let msg = "Hello Nuba!"
let enc = caesar_encrypt(msg, 13)
let dec = caesar_decrypt(enc, 13)
print("Original:", msg)
print("Encrypted:", enc)
print("Decrypted:", dec)
