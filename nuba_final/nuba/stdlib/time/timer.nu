# stdlib/time: Timer and benchmarking utilities
class Timer {
    fun init(self, name) {
        self.name     = name
        self.start    = null
        self.splits   = []
        self.laps     = []
    }
    fun start_timer(self) {
        self.start = time()
        self.splits = [self.start]
        print("[Timer:" + self.name + "] Started")
        return self
    }
    fun lap(self, label) {
        let now = time()
        let elapsed = round((now - self.splits[len(self.splits)-1]) * 1000, 2)
        push(self.splits, now)
        push(self.laps, {"label":label,"ms":elapsed})
        print(format("[Timer:{0}] Lap '{1}': {2}ms", self.name, label, elapsed))
        return self
    }
    fun stop(self) {
        let total = round((time() - self.start) * 1000, 2)
        print(format("[Timer:{0}] Total: {1}ms", self.name, total))
        return total
    }
    fun report(self) {
        print("=== Timer Report:", self.name, "===")
        for lap in self.laps {
            print(format("  {0}: {1}ms", lap["label"], lap["ms"]))
        }
    }
}

fun benchmark(name, fn, iterations) {
    let start = time()
    for i in 0..iterations { fn() }
    let elapsed = round((time()-start)*1000, 2)
    let per_iter = round(elapsed/iterations, 3)
    print(format("Benchmark '{0}': {1}ms total, {2}ms/iter ({3} iters)",
        name, elapsed, per_iter, iterations))
    return elapsed
}

let t = new Timer("MyOperation")
t.start_timer()
let s1 = 0
for i in 0..1000 { s1 += i }
t.lap("Sum 0-1000")
let lst = list(1..501)
let doubled = map(fun(x)->x*2, lst)
t.lap("Map x2")
let evens = filter(fun(x)->x%2==0, doubled)
t.lap("Filter evens")
let total = t.stop()
t.report()
