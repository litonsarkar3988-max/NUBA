# String Exercise: Morse code encoder

let MORSE = {
    "A":".-","B":"-...","C":"-.-.","D":"-..","E":".","F":"..-.","G":"--.","H":"....","I":"..","J":".---",
    "K":"-.-","L":".-..","M":"--","N":"-.","O":"---","P":".--.","Q":"--.-","R":".-.","S":"...","T":"-",
    "U":"..-","V":"...-","W":".--","X":"-..-","Y":"-.--","Z":"--..","0":"-----","1":".----","2":"..---",
    "3":"...--","4":"....-","5":".....","6":"-....","7":"--...","8":"---..","9":"----."
}
fun to_morse(text) {
    let words = split(upper(text), " ")
    let result = []
    for word in words {
        let letters = []
        for ch in word.chars() {
            if has(MORSE, ch) { push(letters, MORSE[ch]) }
        }
        push(result, join(letters, " "))
    }
    return join(result, " / ")
}
print(to_morse("Hello World"))
print(to_morse("Nuba"))
