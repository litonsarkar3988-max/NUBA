# Blockchain: Bridges

print("=== Bridges ===")

# Blockchain simulation utilities

class Block {
    fun init(self, index, data, prev_hash) {
        self.index     = index
        self.data      = data
        self.prev_hash = prev_hash
        self.timestamp = time()
        self.nonce     = 0
        self.hash      = self.calculate_hash()
    }

    fun calculate_hash(self) {
        let h = 5381
        let s = str(self.index) + str(self.data) + str(self.prev_hash) + str(self.nonce)
        for ch in s.chars() { h = (h * 33 + ord(ch)) % 1000000007 }
        return str(h)
    }

    fun mine(self, difficulty) {
        let prefix = "0".repeat(difficulty)
        while not startswith(self.hash, prefix) {
            self.nonce += 1
            self.hash = self.calculate_hash()
        }
        return self.hash
    }
}

class Blockchain {
    fun init(self) {
        self.chain       = []
        self.pending_txs = []
        self.difficulty  = 2
        let genesis = new Block(0, "Genesis Block", "0")
        push(self.chain, genesis)
    }

    fun add_transaction(self, sender, receiver, amount) {
        push(self.pending_txs, {"from":sender,"to":receiver,"amount":amount})
        return self
    }

    fun mine_block(self, miner) {
        let last = self.chain[len(self.chain)-1]
        let block = new Block(len(self.chain), self.pending_txs, last.hash)
        block.mine(self.difficulty)
        push(self.chain, block)
        self.pending_txs = []
        print("Block #" + str(block.index) + " mined! Hash:", block.hash[:20]+"...")
        return block
    }

    fun is_valid(self) {
        for i in 1..len(self.chain) {
            let curr = self.chain[i]
            let prev = self.chain[i-1]
            if curr.prev_hash != prev.hash { return false }
        }
        return true
    }

    fun balance(self, address) {
        let bal = 0
        for block in self.chain {
            if isList(block.data) {
                for tx in block.data {
                    if tx["to"]   == address { bal += tx["amount"] }
                    if tx["from"] == address { bal -= tx["amount"] }
                }
            }
        }
        return bal
    }

    fun stats(self) {
        print("Chain: " + str(len(self.chain)) + " blocks")
        print("Valid:", self.is_valid())
    }
}

# Demo for Bridges
let bc = new Blockchain()
bc.add_transaction("Alice","Bob",50)
bc.add_transaction("Bob","Carol",30)
bc.mine_block("Miner1")
bc.add_transaction("Carol","Alice",10)
bc.mine_block("Miner2")
bc.stats()
print("Alice balance:", bc.balance("Alice"))
print("Bob balance:", bc.balance("Bob"))
