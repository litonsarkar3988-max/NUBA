# tests/benchmark.nu - Performance benchmarks for Nuba

fun bench(name, fn) {
    let start = time()
    let result = fn()
    let elapsed = round((time() - start) * 1000, 2)
    print(format("[{0}] {1}ms | result: {2}", name, elapsed, result))
}

# 1. Fibonacci (recursive)
bench("fib(25) recursive", fun() -> {
    fun fib(n) {
        if n <= 1 { return n }
        return fib(n-1) + fib(n-2)
    }
    return fib(25)
})

# 2. Fibonacci (iterative)
bench("fib(25) iterative", fun() -> {
    let a = 0
    let b = 1
    let i = 0
    while i < 25 {
        let tmp = a + b
        a = b
        b = tmp
        i += 1
    }
    return a
})

# 3. Sum of 1..10000
bench("sum 1..10000", fun() -> {
    let s = 0
    for i in 1..10001 { s += i }
    return s
})

# 4. String building
bench("string concat x500", fun() -> {
    let s = ""
    let i = 0
    while i < 500 {
        s += "x"
        i += 1
    }
    return len(s)
})

# 5. List operations
bench("list push/pop x1000", fun() -> {
    let lst = []
    let i = 0
    while i < 1000 {
        push(lst, i)
        i += 1
    }
    let s = 0
    while len(lst) > 0 { s += pop(lst) }
    return s
})

# 6. Dict operations
bench("dict set/get x500", fun() -> {
    let d = {}
    let i = 0
    while i < 500 {
        d[str(i)] = i * 2
        i += 1
    }
    let s = 0
    for pair in items(d) { s += pair[1] }
    return s
})

# 7. Map/filter chain
bench("map+filter 1..1001", fun() -> {
    let nums = list(1..1001)
    let evens = filter(fun(x) -> x % 2 == 0, nums)
    let doubled = map(fun(x) -> x * 2, evens)
    return sum(doubled)
})

# 8. Class instantiation
bench("1000 class instances", fun() -> {
    class Point {
        fun init(self, x, y) { self.x = x; self.y = y }
        fun dist(self) { return sqrt(self.x*self.x + self.y*self.y) }
    }
    let total = 0
    let i = 0
    while i < 1000 {
        let p = new Point(i, i)
        total += p.dist()
        i += 1
    }
    return round(total, 2)
})

# 9. Sorting
bench("quicksort 500 elements", fun() -> {
    let arr = []
    let i = 500
    while i > 0 {
        push(arr, i)
        i -= 1
    }
    fun qs(a) {
        if len(a) <= 1 { return a }
        let pivot = a[0]
        let l = filter(fun(x)->x<pivot, a.slice(1, len(a)))
        let r = filter(fun(x)->x>=pivot, a.slice(1, len(a)))
        return qs(l) + [pivot] + qs(r)
    }
    let sorted_arr = qs(arr)
    return sorted_arr[len(sorted_arr)-1]
})

print("Benchmarks complete!")
