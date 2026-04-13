# Beginner Exercise 33: sum_evens

let nums = list(1..21)
let evens = filter(fun(x) -> x % 2 == 0, nums)
print("Sum of evens:", sum(evens))
