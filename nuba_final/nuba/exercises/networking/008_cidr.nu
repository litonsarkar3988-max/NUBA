# Networking: Cidr

print("=== Cidr ===")

class NetworkSimulator {
    fun init(self) {
        self.nodes    = {}
        self.edges    = []
        self.packets  = []
        self.log      = []
    }

    fun add_node(self, name, ip, role) {
        self.nodes[name] = {"ip":ip,"role":role,"connections":[],"buffer":[]}
        return self
    }

    fun connect(self, node1, node2, bandwidth, latency) {
        push(self.edges, {"from":node1,"to":node2,"bw":bandwidth,"latency":latency})
        push(self.nodes[node1]["connections"], node2)
        push(self.nodes[node2]["connections"], node1)
        return self
    }

    fun send_packet(self, src, dst, data, protocol) {
        let pkt = {
            "id":      len(self.packets)+1,
            "src":     src,
            "dst":     dst,
            "data":    data,
            "proto":   protocol,
            "hops":    0,
            "status":  "SENT"
        }
        push(self.packets, pkt)
        push(self.log, format("{0} -> {1} [{2}]: {3}", src, dst, protocol, str(data)[:20]))
        return pkt
    }

    fun route(self, src, dst) {
        # Simple BFS routing
        if not has(self.nodes, src) or not has(self.nodes, dst) {
            return null
        }
        let visited = [src]
        let queue = [[src, [src]]]
        while len(queue) > 0 {
            let curr = queue[0][0]
            let path = queue[0][1]
            queue = queue.slice(1, len(queue))
            if curr == dst { return path }
            for neighbor in self.nodes[curr]["connections"] {
                if not visited.contains(neighbor) {
                    push(visited, neighbor)
                    push(queue, [neighbor, path + [neighbor]])
                }
            }
        }
        return null
    }

    fun stats(self) {
        print("Network Topology: Cidr")
        print("Nodes:", len(self.nodes))
        print("Links:", len(self.edges))
        print("Packets sent:", len(self.packets))
    }
}

let net = new NetworkSimulator()
net.add_node("client", "192.168.1.10", "client")
net.add_node("router", "10.0.0.1",     "router")
net.add_node("server", "10.0.0.100",   "server")
net.add_node("db",     "10.0.0.200",   "database")
net.connect("client","router", 100, 5)
net.connect("router","server",  1000, 1)
net.connect("server","db",     1000, 1)

net.send_packet("client","server",{"request":"GET /api/data"},"HTTP")
net.send_packet("server","db",   {"query":"SELECT * FROM users"},"TCP")
net.send_packet("db","server",   {"rows":42},"TCP")

let path = net.route("client","db")
print("Route client->db:", path)
net.stats()
