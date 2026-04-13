# Intermediate: Combinations
fun combine(lst, k) {
    if k == 0 { return [[]] }
    if len(lst) == 0 { return [] }
    let with_first = map(fun(c) -> [lst[0]] + c, combine(lst.slice(1, len(lst)), k-1))
    let without    = combine(lst.slice(1, len(lst)), k)
    return with_first + without
}
let combs = combine([1,2,3,4], 2)
print("C(4,2) =", len(combs))
for c in combs { print(c) }
