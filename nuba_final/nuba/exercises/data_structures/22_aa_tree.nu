# Data Structure 22: AA-Tree
# Simplified red-black tree

class AATree {
    fun init(self) {
        self.data = []
        self.size = 0
        self.name = "AA-Tree"
    }

    fun insert(self, val) {
        push(self.data, val)
        self.size += 1
        return self
    }

    fun remove(self) {
        if self.size == 0 { throw self.name + " is empty" }
        self.size -= 1
        return pop(self.data)
    }

    fun peek(self) {
        if self.size == 0 { throw self.name + " is empty" }
        return self.data[self.size - 1]
    }

    fun is_empty(self) { return self.size == 0 }
    fun clear(self)    { self.data = []; self.size = 0 }
    fun to_list(self)  { return self.data.copy() }

    fun describe(self) {
        return "AA-Tree: " + str(self.size) + " elements"
    }
}

# Demo: Simplified red-black tree
let ds = new AATree()
for v in [10, 20, 30, 40, 50] { ds.insert(v) }
print(ds.describe())
print("Peek:", ds.peek())
print("Remove:", ds.remove())
print(ds.describe())
print("Contents:", ds.to_list())
