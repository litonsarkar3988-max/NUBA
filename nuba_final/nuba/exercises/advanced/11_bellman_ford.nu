# Advanced: Bellman-Ford Algorithm

fun bellman_ford(n, edges, src) {
    let dist = []
    for i in 0..n { push(dist, 999999) }
    dist[src] = 0
    for i in 0..(n-1) {
        for e in edges {
            let u=e[0]; let v=e[1]; let w=e[2]
            if dist[u] != 999999 and dist[u]+w < dist[v] {
                dist[v] = dist[u]+w
            }
        }
    }
    return dist
}
let edges = [[0,1,4],[0,2,1],[2,1,2],[1,3,1],[2,3,5]]
print("Shortest from 0:", bellman_ford(4, edges, 0))
