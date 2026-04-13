# Beginner Exercise 49: zip_lists

let a = [1, 2, 3]
let b = ["a", "b", "c"]
let zipped = zip(a, b)
for pair in zipped {
    print(pair[0], "->", pair[1])
}
