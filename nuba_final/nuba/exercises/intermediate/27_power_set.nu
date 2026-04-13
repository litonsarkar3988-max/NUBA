# Intermediate: Power Set
fun power_set(lst) {
    let result = [[]]
    for x in lst {
        let new_sets = map(fun(s) -> s + [x], result)
        result = result + new_sets
    }
    return result
}
let ps = power_set([1, 2, 3])
print("Power set size:", len(ps))
for s in ps { print(s) }
