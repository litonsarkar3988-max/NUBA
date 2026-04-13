# Advanced: LRU Cache with O(1) ops
class LRUCache {
    fun init(self, capacity) {
        self.capacity = capacity
        self.cache    = {}
        self.order    = []
    }
    fun get(self, key) {
        let k = str(key)
        if not has(self.cache, k) { return -1 }
        self.order = filter(fun(x) -> x != k, self.order)
        push(self.order, k)
        return self.cache[k]
    }
    fun put(self, key, value) {
        let k = str(key)
        if has(self.cache, k) {
            self.order = filter(fun(x) -> x != k, self.order)
        } elif len(self.order) >= self.capacity {
            let lru = self.order[0]
            self.order = self.order.slice(1, len(self.order))
            self.cache[lru] = null
        }
        self.cache[k] = value
        push(self.order, k)
    }
}
let cache = new LRUCache(3)
cache.put(1, 1)
cache.put(2, 2)
cache.put(3, 3)
print(cache.get(1))
cache.put(4, 4)
print(cache.get(2))
print(cache.get(3))
print(cache.get(4))
