# E-Commerce: Product Model
class Product {
    fun init(self, id, name, price, stock, category) {
        self.id       = id
        self.name     = name
        self.price    = price
        self.stock    = stock
        self.category = category
        self.reviews  = []
        self.discount = 0
    }
    fun apply_discount(self, pct) {
        self.discount = pct
        return self
    }
    fun final_price(self) {
        return round(self.price * (1 - self.discount / 100), 2)
    }
    fun add_review(self, user, rating, comment) {
        push(self.reviews, {"user":user,"rating":rating,"comment":comment})
        return self
    }
    fun avg_rating(self) {
        if len(self.reviews) == 0 { return 0 }
        return round(sum(map(fun(r)->r["rating"], self.reviews)) / len(self.reviews), 1)
    }
    fun in_stock(self)  { return self.stock > 0 }
    fun display(self) {
        print(format("[{0}] {1} | ${2} (was ${3}) | Stock:{4} | ★{5}",
            self.id, self.name, self.final_price(), self.price,
            self.stock, self.avg_rating()))
    }
}

let laptop = new Product("P001","Gaming Laptop",999.99,15,"Electronics")
laptop.apply_discount(10)
laptop.add_review("Alice",5,"Amazing performance!")
laptop.add_review("Bob",4,"Good but heavy")
laptop.display()
