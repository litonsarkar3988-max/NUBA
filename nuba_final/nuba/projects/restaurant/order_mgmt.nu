# Restaurant: Order Management
class OrderItem {
    fun init(self, menu_item, qty, notes) {
        self.item  = menu_item
        self.qty   = qty
        self.notes = notes
    }
    fun subtotal(self) { return self.item.price * self.qty }
    fun display(self) {
        print(format("  {0} x{1} = ${2}{3}",
            self.item.name, self.qty,
            round(self.subtotal(),2),
            " [" + self.notes + "]" if len(self.notes)>0 else ""))
    }
}
class RestaurantOrder {
    fun init(self, order_id, table_no, waiter) {
        self.order_id  = order_id
        self.table_no  = table_no
        self.waiter    = waiter
        self.items     = []
        self.status    = "OPEN"
        self.timestamp = "12:00"
    }
    fun add_item(self, menu_item, qty, notes) {
        push(self.items, new OrderItem(menu_item, qty, notes))
        return self
    }
    fun subtotal(self) { return round(sum(map(fun(i)->i.subtotal(),self.items)),2) }
    fun tax(self)      { return round(self.subtotal() * 0.08, 2) }
    fun total(self)    { return round(self.subtotal() + self.tax(), 2) }
    fun send_to_kitchen(self) {
        self.status = "IN_KITCHEN"
        print("Order #"+str(self.order_id)+" sent to kitchen | Table:", self.table_no)
    }
    fun mark_ready(self)     { self.status = "READY";    print("Order #"+str(self.order_id)+" ready!") }
    fun mark_served(self)    { self.status = "SERVED";   print("Order #"+str(self.order_id)+" served") }
    fun print_bill(self) {
        print("\n=== Bill - Table", self.table_no, "===")
        for item in self.items { item.display() }
        print("Subtotal: $" + str(self.subtotal()))
        print("Tax (8%): $" + str(self.tax()))
        print("TOTAL:    $" + str(self.total()))
    }
}
