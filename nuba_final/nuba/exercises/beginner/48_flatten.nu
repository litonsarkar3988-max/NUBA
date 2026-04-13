# Beginner Exercise 48: flatten

let nested = [[1,2],[3,4],[5,6]]
let flat = []
for sub in nested {
    for x in sub { push(flat, x) }
}
print(flat)
