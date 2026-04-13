# Advanced: Graph DFS & BFS
class Graph {
    fun init(self, directed) {
        self.adj      = {}
        self.directed = directed
    }
    fun add_vertex(self, v) {
        if not has(self.adj, v) { self.adj[v] = [] }
    }
    fun add_edge(self, u, v) {
        self.add_vertex(u); self.add_vertex(v)
        push(self.adj[u], v)
        if not self.directed { push(self.adj[v], u) }
    }
    fun dfs(self, start) {
        let visited = []
        fun dfs_visit(v) {
            if visited.contains(v) { return }
            push(visited, v)
            if has(self.adj, v) {
                for neighbor in self.adj[v] { dfs_visit(neighbor) }
            }
        }
        dfs_visit(start)
        return visited
    }
    fun bfs(self, start) {
        let visited = [start]
        let queue   = [start]
        while len(queue) > 0 {
            let v = queue[0]
            queue = queue.slice(1, len(queue))
            if has(self.adj, v) {
                for neighbor in self.adj[v] {
                    if not visited.contains(neighbor) {
                        push(visited, neighbor)
                        push(queue, neighbor)
                    }
                }
            }
        }
        return visited
    }
    fun has_cycle_undirected(self) {
        let visited = []
        fun dfs_cycle(v, parent) {
            push(visited, v)
            if has(self.adj, v) {
                for neighbor in self.adj[v] {
                    if not visited.contains(neighbor) {
                        if dfs_cycle(neighbor, v) { return true }
                    } elif neighbor != parent { return true }
                }
            }
            return false
        }
        for v in keys(self.adj) {
            if not visited.contains(v) {
                if dfs_cycle(v, null) { return true }
            }
        }
        return false
    }
}
let g = new Graph(false)
g.add_edge("A","B"); g.add_edge("A","C")
g.add_edge("B","D"); g.add_edge("C","D"); g.add_edge("D","E")
print("DFS from A:", g.dfs("A"))
print("BFS from A:", g.bfs("A"))
print("Has cycle:", g.has_cycle_undirected())
