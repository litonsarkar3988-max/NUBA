# examples/generics.nu - Generic data structures in Nuba

# Generic Queue
class Queue {
    fun init(self) {
        self.data = []
    }

    fun enqueue(self, item) {
        push(self.data, item)
        return self
    }

    fun dequeue(self) {
        if self.is_empty() { throw "Queue is empty" }
        let item = self.data[0]
        self.data = self.data.slice(1, len(self.data))
        return item
    }

    fun peek(self) {
        if self.is_empty() { throw "Queue is empty" }
        return self.data[0]
    }

    fun is_empty(self) { return len(self.data) == 0 }
    fun size(self)     { return len(self.data) }
    fun to_list(self)  { return self.data.copy() }
}

# Generic Priority Queue (min-heap style via sorted insert)
class PriorityQueue {
    fun init(self) {
        self.items = []     # [priority, value]
    }

    fun enqueue(self, priority, value) {
        push(self.items, [priority, value])
        self.items = sorted(self.items, false)
        return self
    }

    fun dequeue(self) {
        if self.is_empty() { throw "PriorityQueue empty" }
        let item = self.items[0]
        self.items = self.items.slice(1, len(self.items))
        return item[1]
    }

    fun is_empty(self) { return len(self.items) == 0 }
    fun size(self)     { return len(self.items) }
}

# Generic LRU Cache
class LRUCache {
    fun init(self, capacity) {
        self.capacity = capacity
        self.cache    = {}
        self.order    = []
    }

    fun get(self, key) {
        let k = str(key)
        if not has(self.cache, k) { return null }
        self.order = filter(fun(x) -> x != k, self.order)
        push(self.order, k)
        return self.cache[k]
    }

    fun put(self, key, value) {
        let k = str(key)
        if has(self.cache, k) {
            self.order = filter(fun(x) -> x != k, self.order)
        } elif len(self.order) >= self.capacity {
            let oldest = self.order[0]
            self.order = self.order.slice(1, len(self.order))
            self.cache[oldest] = null
        }
        self.cache[k] = value
        push(self.order, k)
    }

    fun show(self) {
        print("LRU Cache (capacity=" + str(self.capacity) + "):")
        for k in self.order {
            print(" ", k, "->", self.cache[k])
        }
    }
}

# Demo Queue
print("=== Queue ===")
let q = new Queue()
q.enqueue("first").enqueue("second").enqueue("third")
print("Size:", q.size())
print("Peek:", q.peek())
print("Dequeued:", q.dequeue())
print("Dequeued:", q.dequeue())
print("Remaining:", q.to_list())

# Demo Priority Queue
print("\n=== Priority Queue ===")
let pq = new PriorityQueue()
pq.enqueue(3, "low priority")
pq.enqueue(1, "high priority")
pq.enqueue(2, "medium priority")
pq.enqueue(1, "also high")
while not pq.is_empty() {
    print(" Processed:", pq.dequeue())
}

# Demo LRU Cache
print("\n=== LRU Cache ===")
let cache = new LRUCache(3)
cache.put("a", 1)
cache.put("b", 2)
cache.put("c", 3)
cache.show()
cache.get("a")   # access a, it becomes most recent
cache.put("d", 4)  # evicts "b" (least recently used)
cache.show()
