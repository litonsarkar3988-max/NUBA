# stdlib/graph: Graph utilities
fun make_graph(directed) {
    return {"adj": {}, "directed": directed, "weights": {}}
}
fun graph_add_vertex(g, v) {
    if not has(g["adj"], v) { g["adj"][v] = [] }
}
fun graph_add_edge(g, u, v, weight) {
    graph_add_vertex(g, u); graph_add_vertex(g, v)
    push(g["adj"][u], v)
    let key = str(u) + "," + str(v)
    g["weights"][key] = weight
    if not g["directed"] {
        push(g["adj"][v], u)
        g["weights"][str(v)+","+str(u)] = weight
    }
}
fun graph_neighbors(g, v) {
    if has(g["adj"], v) { return g["adj"][v] }
    return []
}
fun graph_weight(g, u, v) {
    let key = str(u) + "," + str(v)
    if has(g["weights"], key) { return g["weights"][key] }
    return null
}
fun graph_vertices(g) { return keys(g["adj"]) }
fun graph_dfs(g, start) {
    let visited = []; let stack = [start]
    while len(stack) > 0 {
        let v = stack[len(stack)-1]
        stack = stack.slice(0, len(stack)-1)
        if not visited.contains(v) {
            push(visited, v)
            for n in graph_neighbors(g, v) {
                if not visited.contains(n) { push(stack, n) }
            }
        }
    }
    return visited
}
fun graph_bfs(g, start) {
    let visited = [start]; let queue = [start]
    while len(queue) > 0 {
        let v = queue[0]; queue = queue.slice(1, len(queue))
        for n in graph_neighbors(g, v) {
            if not visited.contains(n) { push(visited, n); push(queue, n) }
        }
    }
    return visited
}
