# Challenge: FizzBuzz
# Print 1 to 100. For multiples of 3 print 'Fizz',
# for multiples of 5 print 'Buzz', for both print 'FizzBuzz'

for i in 1..101 {
    if i % 15 == 0 { print("FizzBuzz") }
    elif i % 3 == 0 { print("Fizz") }
    elif i % 5 == 0 { print("Buzz") }
    else { print(i) }
}
