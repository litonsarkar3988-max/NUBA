# Intermediate: Perfect Numbers
fun is_perfect(n) {
    let s = 0
    for i in 1..n {
        if n % i == 0 { s += i }
    }
    return s == n
}
print("Perfect numbers up to 1000:")
for n in 2..1001 {
    if is_perfect(n) { print(n) }
}
