# Challenge: Sum of Digits
fun digit_sum(n) {
    let total = 0
    for ch in str(abs(n)).chars() { total += int(ch) }
    return total
}
print(digit_sum(12345))
print(digit_sum(9999))
