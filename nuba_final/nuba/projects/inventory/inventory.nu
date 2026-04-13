# Project: Inventory Management System
class Product {
    fun init(self, sku, name, price, quantity) {
        self.sku      = sku
        self.name     = name
        self.price    = price
        self.quantity = quantity
    }
    fun total_value(self) { return self.price * self.quantity }
    fun info(self) {
        return format("[{0}] {1} | Price: ${2} | Qty: {3} | Value: ${4}",
                      self.sku, self.name, self.price, self.quantity,
                      round(self.total_value(), 2))
    }
}
class Inventory {
    fun init(self) { self.products = {} }
    fun add(self, product) {
        self.products[product.sku] = product
    }
    fun restock(self, sku, qty) {
        if not has(self.products, sku) { throw "Product not found: " + sku }
        self.products[sku].quantity += qty
        print("Restocked", self.products[sku].name, "by", qty)
    }
    fun sell(self, sku, qty) {
        if not has(self.products, sku) { throw "Product not found" }
        let p = self.products[sku]
        if p.quantity < qty { throw "Insufficient stock for " + p.name }
        p.quantity -= qty
        let revenue = p.price * qty
        print("Sold", qty, "x", p.name, "| Revenue: $" + str(revenue))
        return revenue
    }
    fun low_stock(self, threshold) {
        let result = []
        for pair in items(self.products) {
            if pair[1].quantity <= threshold { push(result, pair[1]) }
        }
        return result
    }
    fun total_value(self) {
        let total = 0
        for pair in items(self.products) { total += pair[1].total_value() }
        return round(total, 2)
    }
    fun report(self) {
        print("=== Inventory Report ===")
        for pair in items(self.products) { print(" ", pair[1].info()) }
        print("Total inventory value: $" + str(self.total_value()))
    }
}
let inv = new Inventory()
inv.add(new Product("P001", "Laptop", 999.99, 10))
inv.add(new Product("P002", "Mouse", 29.99, 50))
inv.add(new Product("P003", "Keyboard", 79.99, 30))
inv.add(new Product("P004", "Monitor", 399.99, 5))
inv.sell("P001", 3)
inv.sell("P002", 20)
inv.restock("P004", 10)
print()
inv.report()
print()
print("Low stock (<=5):")
for p in inv.low_stock(5) { print(" ", p.info()) }
