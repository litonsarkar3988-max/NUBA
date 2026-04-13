# Beginner Exercise 40: num_to_hex

fun to_hex(n) {
    let digits = "0123456789ABCDEF"
    if n == 0 { return "0" }
    let result = []
    while n > 0 {
        push(result, substr(digits, n % 16, n % 16 + 1))
        n = floor(n / 16)
    }
    return join(reversed(result), "")
}
print(to_hex(255))
