# E-Commerce: Order Processing
class Order {
    fun init(self, id, user, items, address) {
        self.id        = id
        self.user      = user
        self.items     = items
        self.address   = address
        self.status    = "PENDING"
        self.total     = sum(map(fun(i)->i.subtotal(), items))
        self.history   = [{"status":"PENDING","note":"Order placed"}]
    }
    fun update_status(self, status, note) {
        self.status = status
        push(self.history, {"status":status,"note":note})
        print("Order", self.id, "->", status, "|", note)
        return self
    }
    fun confirm(self)  { return self.update_status("CONFIRMED","Payment verified") }
    fun ship(self)     { return self.update_status("SHIPPED","Dispatched from warehouse") }
    fun deliver(self)  { return self.update_status("DELIVERED","Package delivered") }
    fun cancel(self, reason) { return self.update_status("CANCELLED", reason) }
    fun receipt(self) {
        print("=== Order Receipt #" + self.id + " ===")
        print("Customer:", self.user)
        print("Ship to:", self.address)
        for item in self.items {
            print(" ", item.product.name, "x"+str(item.qty), "= $"+str(round(item.subtotal(),2)))
        }
        print("Total: $" + str(round(self.total,2)))
        print("Status:", self.status)
    }
}
