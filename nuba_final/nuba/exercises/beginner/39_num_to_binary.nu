# Beginner Exercise 39: num_to_binary

fun to_binary(n) {
    if n == 0 { return "0" }
    let bits = []
    while n > 0 {
        push(bits, str(n % 2))
        n = floor(n / 2)
    }
    return join(reversed(bits), "")
}
print(to_binary(42))
