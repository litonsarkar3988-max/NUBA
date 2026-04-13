# Daily Challenge 8: Implement queue using stacks

class QueueFromStacks {
    fun init(self) { self.s1=[]; self.s2=[] }
    fun enqueue(self,x) { push(self.s1,x) }
    fun dequeue(self) {
        if len(self.s2)==0 {
            while len(self.s1)>0 { push(self.s2,pop(self.s1)) }
        }
        if len(self.s2)==0 { throw "Queue empty" }
        return pop(self.s2)
    }
    fun peek(self) {
        if len(self.s2)==0 { return self.s1[0] }
        return self.s2[len(self.s2)-1]
    }
}
let q=new QueueFromStacks()
q.enqueue(1); q.enqueue(2); q.enqueue(3)
print(q.dequeue()); print(q.dequeue()); q.enqueue(4); print(q.dequeue())
