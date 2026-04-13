# Intermediate: Stack Implementation
class Stack {
    fun init(self) { self.data = [] }
    fun push(self, x) { push(self.data, x) }
    fun pop(self) {
        if self.is_empty() { throw "Stack underflow" }
        return pop(self.data)
    }
    fun peek(self) { return self.data[len(self.data)-1] }
    fun is_empty(self) { return len(self.data) == 0 }
    fun size(self) { return len(self.data) }
}
let s = new Stack()
s.push(1); s.push(2); s.push(3)
print("Peek:", s.peek())
print("Pop:", s.pop())
print("Size:", s.size())
