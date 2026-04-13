# Beginner Exercise 43: lcm

fun gcd(a, b) {
    while b != 0 { let t=b; b=a%b; a=t }
    return a
}
fun lcm(a, b) { return a * b / gcd(a, b) }
print("LCM(12,18):", lcm(12, 18))
