# Beginner Exercise 32: count_evens

let nums = list(1..21)
let evens = filter(fun(x) -> x % 2 == 0, nums)
print("Even count:", len(evens))
