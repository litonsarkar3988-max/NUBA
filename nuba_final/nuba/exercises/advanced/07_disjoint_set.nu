# Advanced: Union Find / Disjoint Set

class DisjointSet {
    fun init(self, n) {
        self.parent = list(0..n)
        self.rank   = []
        for i in 0..n { push(self.rank, 0) }
    }
    fun find(self, x) {
        if self.parent[x] != x {
            self.parent[x] = self.find(self.parent[x])
        }
        return self.parent[x]
    }
    fun union(self, x, y) {
        let px = self.find(x); let py = self.find(y)
        if px == py { return false }
        if self.rank[px] < self.rank[py] { self.parent[px] = py }
        elif self.rank[px] > self.rank[py] { self.parent[py] = px }
        else { self.parent[py] = px; self.rank[px] += 1 }
        return true
    }
    fun connected(self, x, y) { return self.find(x) == self.find(y) }
}
let ds = new DisjointSet(6)
ds.union(0,1); ds.union(1,2); ds.union(3,4)
print("0-2 connected:", ds.connected(0, 2))
print("0-3 connected:", ds.connected(0, 3))
ds.union(2,3)
print("0-4 connected now:", ds.connected(0, 4))
