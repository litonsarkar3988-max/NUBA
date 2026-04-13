# E-Commerce: Complete Shop Demo
# Brings together all e-commerce components

print("=== Nuba Online Shop ===")
print()

# Products
class Product {
    fun init(self, id, name, price, stock, category) {
        self.id=id; self.name=name; self.price=price
        self.stock=stock; self.category=category; self.discount=0
    }
    fun final_price(self) { return round(self.price*(1-self.discount/100),2) }
    fun display(self) {
        print(format("  [{0}] {1} - ${2} (stock:{3})",self.id,self.name,self.final_price(),self.stock))
    }
}
class CartItem { fun init(self,p,q){self.product=p;self.qty=q} fun subtotal(self){return self.product.final_price()*self.qty} }
class Cart {
    fun init(self,u){self.user=u;self.items=[]}
    fun add(self,p,q){ push(self.items,new CartItem(p,q)); return self }
    fun total(self){ return round(sum(map(fun(i)->i.subtotal(),self.items)),2) }
    fun checkout(self){
        print("=== Checkout for",self.user,"===")
        for i in self.items {
            print(format("  {0} x{1} = ${2}",i.product.name,i.qty,round(i.subtotal(),2)))
        }
        print("TOTAL: $" + str(self.total()))
        print("Order placed successfully!")
    }
}

let products = [
    new Product("P001","Laptop",  999.99, 10, "Electronics"),
    new Product("P002","Mouse",    29.99, 50, "Electronics"),
    new Product("P003","Keyboard", 79.99, 30, "Electronics"),
    new Product("P004","Headphones",149.99,20,"Electronics"),
    new Product("P005","Webcam",   89.99, 25, "Electronics"),
]
products[0].discount = 15
products[3].discount = 10

print("Available Products:")
for p in products { p.display() }
print()

let alice_cart = new Cart("Alice")
alice_cart.add(products[0], 1).add(products[1], 2).add(products[3], 1)
alice_cart.checkout()
print()

let bob_cart = new Cart("Bob")
bob_cart.add(products[2], 1).add(products[4], 1)
bob_cart.checkout()
