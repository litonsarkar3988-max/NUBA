# Beginner Exercise 38: sum_digits

let n = 12345
let s = str(n)
let total = 0
for ch in s.chars() { total += int(ch) }
print("Digit sum:", total)
