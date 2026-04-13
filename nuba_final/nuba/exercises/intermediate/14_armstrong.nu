# Intermediate: Armstrong Numbers
fun is_armstrong(n) {
    let digits = str(n).chars()
    let power = len(digits)
    let total = 0
    for d in digits { total += int(d) ** power }
    return total == n
}
print("Armstrong numbers up to 1000:")
for n in 1..1001 {
    if is_armstrong(n) { print(n) }
}
