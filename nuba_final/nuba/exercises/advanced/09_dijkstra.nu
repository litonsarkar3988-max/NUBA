# Advanced: Dijkstra Shortest Path

fun dijkstra(graph, start) {
    let dist = {}
    let visited = []
    for v in keys(graph) { dist[v] = 999999 }
    dist[start] = 0
    while true {
        let u = null
        for v in keys(dist) {
            if not visited.contains(v) {
                if u == null or dist[v] < dist[u] { u = v }
            }
        }
        if u == null { break }
        push(visited, u)
        if has(graph, u) {
            for pair in graph[u] {
                let v = pair[0]; let w = pair[1]
                if dist[u] + w < dist[v] { dist[v] = dist[u] + w }
            }
        }
    }
    return dist
}
let g = {"A":[["B",1],["C",4]],"B":[["C",2],["D",5]],"C":[["D",1]],"D":[]}
print("Shortest from A:", dijkstra(g, "A"))
