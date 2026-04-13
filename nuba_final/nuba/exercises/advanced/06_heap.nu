# Advanced: Min Heap

class MinHeap {
    fun init(self) { self.data = [] }
    fun parent(self, i)  { return floor((i-1)/2) }
    fun left(self, i)    { return 2*i+1 }
    fun right(self, i)   { return 2*i+2 }
    fun swap(self, i, j) {
        let tmp = self.data[i]; self.data[i]=self.data[j]; self.data[j]=tmp
    }
    fun push(self, val) {
        push(self.data, val)
        let i = len(self.data) - 1
        while i > 0 and self.data[self.parent(i)] > self.data[i] {
            self.swap(i, self.parent(i))
            i = self.parent(i)
        }
    }
    fun pop(self) {
        if len(self.data) == 0 { throw "Heap empty" }
        let min_val = self.data[0]
        let last = pop(self.data)
        if len(self.data) > 0 {
            self.data[0] = last
            self.heapify_down(0)
        }
        return min_val
    }
    fun heapify_down(self, i) {
        let n = len(self.data)
        let smallest = i
        if self.left(i) < n and self.data[self.left(i)] < self.data[smallest] {
            smallest = self.left(i)
        }
        if self.right(i) < n and self.data[self.right(i)] < self.data[smallest] {
            smallest = self.right(i)
        }
        if smallest != i { self.swap(i, smallest); self.heapify_down(smallest) }
    }
    fun peek(self) { return self.data[0] }
    fun size(self)  { return len(self.data) }
}
let h = new MinHeap()
for v in [5, 3, 8, 1, 9, 2, 7] { h.push(v) }
print("Min:", h.peek())
let sorted_out = []
while h.size() > 0 { push(sorted_out, h.pop()) }
print("Heap sort:", sorted_out)
