// Algorithm: Graph Algorithms
#include <iostream>
#include <vector>
#include <queue>
#include <stack>
#include <climits>
using namespace std;

const int INF = INT_MAX;

// BFS
vector<int> bfs(const vector<vector<int>>& adj, int start, int n) {
    vector<bool> visited(n, false);
    vector<int> order;
    queue<int> q;
    visited[start] = true;
    q.push(start);
    while (!q.empty()) {
        int v = q.front(); q.pop();
        order.push_back(v);
        for (int u : adj[v])
            if (!visited[u]) { visited[u] = true; q.push(u); }
    }
    return order;
}

// DFS
void dfs_helper(const vector<vector<int>>& adj, int v,
                vector<bool>& visited, vector<int>& order) {
    visited[v] = true;
    order.push_back(v);
    for (int u : adj[v])
        if (!visited[u]) dfs_helper(adj, u, visited, order);
}

vector<int> dfs(const vector<vector<int>>& adj, int start, int n) {
    vector<bool> visited(n, false);
    vector<int> order;
    dfs_helper(adj, start, visited, order);
    return order;
}

// Dijkstra
vector<int> dijkstra(const vector<vector<pair<int,int>>>& adj, int src, int n) {
    vector<int> dist(n, INF);
    priority_queue<pair<int,int>, vector<pair<int,int>>, greater<>> pq;
    dist[src] = 0;
    pq.push({0, src});
    while (!pq.empty()) {
        auto [d, u] = pq.top(); pq.pop();
        if (d > dist[u]) continue;
        for (auto [v, w] : adj[u])
            if (dist[u] + w < dist[v]) {
                dist[v] = dist[u] + w;
                pq.push({dist[v], v});
            }
    }
    return dist;
}

int main() {
    int n = 5;
    vector<vector<int>> adj(n);
    adj[0] = {1, 2}; adj[1] = {0, 3, 4};
    adj[2] = {0, 4}; adj[3] = {1}; adj[4] = {1, 2};

    auto bfs_order = bfs(adj, 0, n);
    cout << "BFS: "; for (int v : bfs_order) cout << v << " "; cout << endl;

    auto dfs_order = dfs(adj, 0, n);
    cout << "DFS: "; for (int v : dfs_order) cout << v << " "; cout << endl;

    vector<vector<pair<int,int>>> wadj(n);
    wadj[0].push_back({1, 4}); wadj[0].push_back({2, 1});
    wadj[2].push_back({1, 2}); wadj[1].push_back({3, 1});
    wadj[2].push_back({3, 5}); wadj[3].push_back({4, 3});

    auto dist = dijkstra(wadj, 0, n);
    cout << "Dijkstra from 0: ";
    for (int d : dist) cout << (d == INF ? -1 : d) << " ";
    cout << endl;
    return 0;
}
