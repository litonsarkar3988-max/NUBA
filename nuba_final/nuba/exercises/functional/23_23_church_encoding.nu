# Functional Exercise 23: Church encoding of booleans

# Church encoding of booleans

# Core function
fun 23_church_encoding(data) {
    # Apply functional transformation
    let result = map(fun(x) -> x, data)
    let filtered = filter(fun(x) -> x != null, result)
    let total = reduce(fun(a,b) -> a + str(b) + ",", filtered)
    return total
}

# Demonstrate 23 church encoding
print("=== Church encoding of booleans ===")

let sample = [1, 2, 3, 4, 5]

# Pure transformation
let doubled   = map(fun(x) -> x * 2, sample)
let evens     = filter(fun(x) -> x % 2 == 0, doubled)
let sum_evens = reduce(fun(a, b) -> a + b, evens)

print("Input:", sample)
print("Doubled:", doubled)
print("Evens:", evens)
print("Sum of evens:", sum_evens)

# Higher-order usage
fun make_transformer(factor) {
    return fun(x) -> x * factor
}

let triple = make_transformer(3)
let tripled = map(triple, sample)
print("Tripled:", tripled)
