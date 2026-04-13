# Advanced: Topological Sort (DFS)

fun topo_sort(graph) {
    let visited = []
    let stack = []
    fun dfs(v) {
        push(visited, v)
        if has(graph, v) {
            for neighbor in graph[v] {
                if not visited.contains(neighbor) { dfs(neighbor) }
            }
        }
        push(stack, v)
    }
    for v in keys(graph) {
        if not visited.contains(v) { dfs(v) }
    }
    return reversed(stack)
}
let g = {"A":["C"],"B":["C","D"],"C":["E"],"D":["F"],"E":["F"],"F":[]}
print("Topological order:", topo_sort(g))
