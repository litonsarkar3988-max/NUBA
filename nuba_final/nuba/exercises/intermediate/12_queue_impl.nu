# Intermediate: Queue Implementation
class Queue {
    fun init(self) { self.data = [] }
    fun enqueue(self, x) { push(self.data, x) }
    fun dequeue(self) {
        if self.is_empty() { throw "Queue empty" }
        let val = self.data[0]
        self.data = self.data.slice(1, len(self.data))
        return val
    }
    fun front(self) { return self.data[0] }
    fun is_empty(self) { return len(self.data) == 0 }
    fun size(self) { return len(self.data) }
}
let q = new Queue()
q.enqueue("a"); q.enqueue("b"); q.enqueue("c")
print(q.dequeue()); print(q.front()); print(q.size())
