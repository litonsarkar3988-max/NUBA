# FizzBuzz Explained

FizzBuzz is a classic programming challenge.

```nuba
for i in 1..101 {
    if i % 15 == 0 { print("FizzBuzz") }
    elif i % 3 == 0 { print("Fizz") }
    elif i % 5 == 0 { print("Buzz") }
    else { print(i) }
}
```

Key concepts:
- `for` loop with range `1..101` (1 to 100)
- `%` modulo operator
- `if/elif/else` chain
