# Beginner Exercise 47: remove_duplicates

let lst = [1, 2, 2, 3, 3, 3, 4]
let seen = {}
let unique = []
for x in lst {
    if not has(seen, x) {
        seen[x] = true
        push(unique, x)
    }
}
print(unique)
