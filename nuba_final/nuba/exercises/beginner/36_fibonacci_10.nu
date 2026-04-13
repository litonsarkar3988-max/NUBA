# Beginner Exercise 36: fibonacci_10

let a = 0
let b = 1
print("Fibonacci:")
for i in 0..10 {
    print(a)
    let tmp = a + b
    a = b
    b = tmp
}
