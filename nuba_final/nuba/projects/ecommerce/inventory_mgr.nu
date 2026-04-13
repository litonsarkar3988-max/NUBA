# E-Commerce: Inventory Manager
class InventoryManager {
    fun init(self) {
        self.stock      = {}
        self.thresholds = {}
        self.history    = []
        self.alerts     = []
    }
    fun set_stock(self, product_id, qty, threshold) {
        self.stock[product_id]      = qty
        self.thresholds[product_id] = threshold
    }
    fun add_stock(self, product_id, qty, reason) {
        if not has(self.stock, product_id) { self.stock[product_id] = 0 }
        self.stock[product_id] += qty
        push(self.history, {"product":product_id,"change":qty,"reason":reason,"type":"IN"})
        print("Restocked", product_id, "+"+str(qty), "|", reason)
        return self
    }
    fun remove_stock(self, product_id, qty, reason) {
        if not has(self.stock, product_id) { throw "Product not tracked: "+product_id }
        if self.stock[product_id] < qty { throw "Insufficient stock: "+product_id }
        self.stock[product_id] -= qty
        push(self.history, {"product":product_id,"change":-qty,"reason":reason,"type":"OUT"})
        self._check_threshold(product_id)
        return self
    }
    fun _check_threshold(self, product_id) {
        if has(self.thresholds, product_id) {
            if self.stock[product_id] <= self.thresholds[product_id] {
                let alert = "LOW STOCK: " + product_id + " (" + str(self.stock[product_id]) + " left)"
                push(self.alerts, alert)
                print("⚠️  " + alert)
            }
        }
    }
    fun get_stock(self, product_id) {
        return self.stock[product_id] if has(self.stock, product_id) else 0
    }
    fun report(self) {
        print("=== Inventory Report ===")
        for pair in items(self.stock) {
            let threshold = self.thresholds[pair[0]] if has(self.thresholds, pair[0]) else "N/A"
            let status = "⚠️" if pair[1] <= int(str(threshold)) else "✓" if threshold != "N/A" else "-"
            print(format("  {0}: {1} units {2} (min: {3})", pair[0], pair[1], status, threshold))
        }
        print("Active alerts:", len(self.alerts))
    }
}

let inv = new InventoryManager()
inv.set_stock("LAPTOP",   20, 5)
inv.set_stock("MOUSE",    50, 10)
inv.set_stock("KEYBOARD", 30, 8)
inv.remove_stock("LAPTOP", 16, "Sales order #001")
inv.remove_stock("MOUSE",  42, "Sales order #002")
inv.add_stock("LAPTOP",   10, "Restock from supplier")
inv.report()
