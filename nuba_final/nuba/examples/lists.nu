# examples/lists.nu - Lists and data structures in Nuba

# Basic list
let nums = [1, 2, 3, 4, 5]
print("List:", nums)
print("Length:", len(nums))
print("First:", nums[0])
print("Last:", nums[len(nums) - 1])

# Push / pop
push(nums, 6)
print("After push:", nums)
let last = pop(nums)
print("Popped:", last)

# Slicing via method
print("Slice [1..3]:", nums.slice(1, 3))

# List operations
let a = [1, 2, 3]
let b = [4, 5, 6]
let c = a + b
print("Concat:", c)

# Nested lists (2D)
let matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
print("Matrix row 1:", matrix[1])
print("Element [2][2]:", matrix[2][2])

# Functional operations
let squares = map(fun(x) -> x * x, 1..6)
print("Squares:", squares)

let evens = filter(fun(x) -> x % 2 == 0, 1..11)
print("Evens:", evens)

let total = reduce(fun(a, b) -> a + b, [1, 2, 3, 4, 5])
print("Sum:", total)

# Sorting
let unsorted = [5, 2, 8, 1, 9, 3, 7]
let asc  = sorted(unsorted)
let desc = sorted(unsorted, true)
print("Ascending:", asc)
print("Descending:", desc)

# forEach
print("Doubled values:")
let vals = [10, 20, 30]
for _v in vals { print(" ", _v * 2) }

# Zip and enumerate
let names  = ["Alice", "Bob", "Charlie"]
let scores = [95, 82, 77]
let pairs  = zip(names, scores)
print("Pairs:", pairs)

print("Enumerated:")
for pair in enumerate(names) {
    print(" ", pair[0], "->", pair[1])
}

# Flat
let nested = [[1, 2], [3, 4], [5, 6]]
print("Flattened:", nested.flat())

# Contains / indexOf
print("Has 3:", nums.contains(3))
print("Index of 4:", nums.indexOf(4))

# Copy
let original = [1, 2, 3]
let copy = original.copy()
push(copy, 99)
print("Original unchanged:", original)
print("Copy modified:", copy)

# List as queue
let queue = []
push(queue, "task1")
push(queue, "task2")
push(queue, "task3")
print("Processing queue:")
while len(queue) > 0 {
    let task = queue[0]
    remove(queue, task)
    print("  Processing:", task)
}
