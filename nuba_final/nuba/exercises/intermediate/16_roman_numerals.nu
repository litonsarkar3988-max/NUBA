# Intermediate: Roman Numerals
fun to_roman(n) {
    let vals  = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
    let syms  = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
    let result = ""
    for i in 0..len(vals) {
        while n >= vals[i] {
            result += syms[i]
            n -= vals[i]
        }
    }
    return result
}
for n in [1, 4, 9, 14, 40, 90, 399, 1994, 2024] {
    print(n, "->", to_roman(n))
}
