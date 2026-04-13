# Advanced: Kruskal Minimum Spanning Tree

class DSU {
    fun init(self, n) { self.p = list(0..n); self.r = [] ; for i in 0..n { push(self.r,0) } }
    fun find(self, x) { if self.p[x]!=x { self.p[x]=self.find(self.p[x]) }; return self.p[x] }
    fun union(self, x, y) {
        let px=self.find(x); let py=self.find(y)
        if px==py { return false }
        if self.r[px]<self.r[py] { self.p[px]=py }
        elif self.r[px]>self.r[py] { self.p[py]=px }
        else { self.p[py]=px; self.r[px]+=1 }
        return true
    }
}
fun kruskal(n, edges) {
    let sorted_e = sorted(edges, false)
    sorted_e = reversed(sorted_e)
    let dsu = new DSU(n)
    let mst = []; let cost = 0
    for e in sorted_e {
        let u=e[1]; let v=e[2]; let w=e[0]
        if dsu.union(u, v) { push(mst, e); cost += w }
    }
    return [cost, mst]
}
let edges = [[4,0,1],[2,1,2],[5,0,2],[1,2,3],[3,1,3]]
let result = kruskal(4, edges)
print("MST cost:", result[0])
print("MST edges:", result[1])
