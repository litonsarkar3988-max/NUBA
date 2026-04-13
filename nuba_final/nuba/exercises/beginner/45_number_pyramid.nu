# Beginner Exercise 45: number_pyramid

let n = 5
for i in 1..(n+1) {
    let row = ""
    for j in 1..(i+1) { row += str(j) }
    print(row)
}
