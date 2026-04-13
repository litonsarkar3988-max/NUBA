# LeetCode Style: Climbing Stairs

fun climb(n){
    if n<=2 { return n }
    let a=1; let b=2
    for i in 3..(n+1) { let c=a+b; a=b; b=c }
    return b
}
for n in 1..11 { print(n,"stairs:",climb(n)) }
