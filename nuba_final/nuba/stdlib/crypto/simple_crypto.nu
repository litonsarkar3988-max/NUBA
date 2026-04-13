# stdlib/crypto: Simple cryptographic utilities
fun rot13(s) {
    let result = ""
    for ch in s.chars() {
        let c = ord(ch)
        if c >= 65 and c <= 90 { result += char((c - 65 + 13) % 26 + 65) }
        elif c >= 97 and c <= 122 { result += char((c - 97 + 13) % 26 + 97) }
        else { result += ch }
    }
    return result
}
fun vigenere_encrypt(text, key) {
    let result = ""
    let key_chars = key.lower().chars()
    let ki = 0
    for ch in text.chars() {
        let c = ord(ch)
        if c >= 65 and c <= 90 {
            let shift = ord(key_chars[ki % len(key_chars)]) - 97
            result += char((c - 65 + shift) % 26 + 65)
            ki += 1
        } elif c >= 97 and c <= 122 {
            let shift = ord(key_chars[ki % len(key_chars)]) - 97
            result += char((c - 97 + shift) % 26 + 97)
            ki += 1
        } else { result += ch }
    }
    return result
}
fun vigenere_decrypt(text, key) {
    let result = ""
    let key_chars = key.lower().chars()
    let ki = 0
    for ch in text.chars() {
        let c = ord(ch)
        if c >= 65 and c <= 90 {
            let shift = ord(key_chars[ki % len(key_chars)]) - 97
            result += char((c - 65 - shift + 26) % 26 + 65)
            ki += 1
        } elif c >= 97 and c <= 122 {
            let shift = ord(key_chars[ki % len(key_chars)]) - 97
            result += char((c - 97 - shift + 26) % 26 + 97)
            ki += 1
        } else { result += ch }
    }
    return result
}
fun simple_hash(s) {
    let h = 5381
    for ch in s.chars() { h = (h * 33 + ord(ch)) % 1000000007 }
    return h
}
fun xor_cipher(data, key) {
    let result = []
    let key_bytes = map(fun(ch) -> ord(ch), key.chars())
    let data_bytes = map(fun(ch) -> ord(ch), data.chars())
    for i in 0..len(data_bytes) {
        push(result, char((data_bytes[i] + key_bytes[i % len(key_bytes)]) % 128))
    }
    return join(result, "")
}
