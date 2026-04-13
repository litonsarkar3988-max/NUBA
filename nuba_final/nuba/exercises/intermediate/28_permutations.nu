# Intermediate: Generate Permutations
fun permute(lst) {
    if len(lst) <= 1 { return [lst] }
    let result = []
    for i in 0..len(lst) {
        let first = lst[i]
        let rest  = filter(fun(x) -> x != first, lst)
        for p in permute(rest) {
            push(result, [first] + p)
        }
    }
    return result
}
let perms = permute([1, 2, 3])
print("Permutations:", len(perms))
for p in perms { print(p) }
