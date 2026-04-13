# Math Exercise: Euler's Totient Function

fun gcd(a, b) {
    while b != 0 { let t=b; b=a%b; a=t }
    return a
}
fun totient(n) {
    let count = 0
    for i in 1..(n+1) {
        if gcd(i, n) == 1 { count += 1 }
    }
    return count
}
for n in [1,2,6,9,10,12] { print("phi("+str(n)+") =", totient(n)) }
