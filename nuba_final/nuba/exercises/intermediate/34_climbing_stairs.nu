# Intermediate: Climbing Stairs (DP)
fun climb_stairs(n) {
    if n <= 2 { return n }
    let a = 1; let b = 2
    for i in 3..(n+1) {
        let c = a + b; a = b; b = c
    }
    return b
}
for n in [1,2,3,4,5,6,7,8,9,10] {
    print("stairs(" + str(n) + ") =", climb_stairs(n))
}
