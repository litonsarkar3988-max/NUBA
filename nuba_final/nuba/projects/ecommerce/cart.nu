# E-Commerce: Shopping Cart
class CartItem {
    fun init(self, product, qty) {
        self.product = product
        self.qty     = qty
    }
    fun subtotal(self) { return self.product.final_price() * self.qty }
}

class Cart {
    fun init(self, user) {
        self.user  = user
        self.items = []
        self.coupon = null
    }
    fun add(self, product, qty) {
        for item in self.items {
            if item.product.id == product.id {
                item.qty += qty
                print("Updated qty for:", product.name)
                return self
            }
        }
        push(self.items, new CartItem(product, qty))
        print("Added to cart:", product.name, "x" + str(qty))
        return self
    }
    fun remove(self, product_id) {
        self.items = filter(fun(i)->i.product.id != product_id, self.items)
        return self
    }
    fun subtotal(self) {
        return round(sum(map(fun(i)->i.subtotal(), self.items)), 2)
    }
    fun apply_coupon(self, code, discount_pct) {
        self.coupon = {"code":code,"pct":discount_pct}
        print("Coupon applied:", code, "-" + str(discount_pct) + "%")
        return self
    }
    fun total(self) {
        let sub = self.subtotal()
        if self.coupon != null {
            return round(sub * (1 - self.coupon["pct"]/100), 2)
        }
        return sub
    }
    fun summary(self) {
        print("=== Cart for", self.user, "===")
        for item in self.items {
            print(format("  {0} x{1} = ${2}",
                item.product.name, item.qty, round(item.subtotal(),2)))
        }
        print("Subtotal: $" + str(self.subtotal()))
        if self.coupon != null { print("Coupon:", self.coupon["code"]) }
        print("Total: $" + str(self.total()))
    }
}
