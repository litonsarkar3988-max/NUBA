# Math Exercise: Modular Exponentiation

fun mod_pow(base, exp, mod) {
    let result = 1
    base = base % mod
    while exp > 0 {
        if exp % 2 == 1 { result = (result * base) % mod }
        exp = floor(exp / 2)
        base = (base * base) % mod
    }
    return result
}
print(mod_pow(2, 10, 1000))
print(mod_pow(3, 200, 1000000007))
