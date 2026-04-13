# E-Commerce: Review & Rating System
class Review {
    fun init(self, review_id, product_id, user, rating, title, body) {
        self.id         = review_id
        self.product_id = product_id
        self.user       = user
        self.rating     = rating
        self.title      = title
        self.body       = body
        self.helpful    = 0
        self.verified   = false
    }
    fun mark_helpful(self) { self.helpful += 1 }
    fun verify(self) { self.verified = true }
    fun display(self) {
        let stars = "★".repeat(self.rating) + "☆".repeat(5 - self.rating)
        let badge  = "[Verified]" if self.verified else ""
        print(format("{0} {1} {2}", stars, self.user, badge))
        print("  " + self.title)
        print("  " + self.body)
        print("  Helpful:", self.helpful)
    }
}
class ReviewSystem {
    fun init(self) { self.reviews = {}; self.next_id = 1 }
    fun add(self, product_id, user, rating, title, body) {
        let r = new Review(self.next_id, product_id, user, rating, title, body)
        if not has(self.reviews, product_id) { self.reviews[product_id] = [] }
        push(self.reviews[product_id], r)
        self.next_id += 1
        return r
    }
    fun for_product(self, product_id) {
        if not has(self.reviews, product_id) { return [] }
        return self.reviews[product_id]
    }
    fun avg_rating(self, product_id) {
        let revs = self.for_product(product_id)
        if len(revs) == 0 { return 0 }
        return round(sum(map(fun(r)->r.rating, revs)) / len(revs), 1)
    }
    fun top_reviews(self, product_id, n) {
        let revs = self.for_product(product_id).copy()
        revs = sorted(revs, true)
        return revs.slice(0, n)
    }
    fun summary(self, product_id) {
        let revs = self.for_product(product_id)
        print("=== Reviews for Product", product_id, "===")
        print("Average Rating:", self.avg_rating(product_id), "/ 5")
        print("Total Reviews:", len(revs))
        for r in revs { r.display(); print() }
    }
}

let rs = new ReviewSystem()
let r1 = rs.add("LAPTOP","Alice",5,"Best laptop ever!","Incredible performance, runs everything smoothly.")
let r2 = rs.add("LAPTOP","Bob",  4,"Good but pricey", "Great specs, but a bit expensive for most users.")
let r3 = rs.add("LAPTOP","Carol",5,"Highly recommend","Perfect for gaming and programming work.")
r1.verify(); r2.mark_helpful(); r2.mark_helpful(); r3.verify()
rs.summary("LAPTOP")
