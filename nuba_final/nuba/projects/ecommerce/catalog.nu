# E-Commerce: Product Catalog
class Catalog {
    fun init(self) {
        self.products   = {}
        self.categories = {}
    }
    fun add(self, product) {
        self.products[product.id] = product
        if not has(self.categories, product.category) {
            self.categories[product.category] = []
        }
        push(self.categories[product.category], product.id)
        return self
    }
    fun get(self, id) {
        if not has(self.products, id) { throw "Product not found: " + id }
        return self.products[id]
    }
    fun search(self, query) {
        let q = lower(query)
        return filter(fun(p)->contains(lower(p.name),q) or contains(lower(p.category),q),
                      values(self.products))
    }
    fun by_category(self, cat) {
        if not has(self.categories, cat) { return [] }
        return map(fun(id)->self.products[id], self.categories[cat])
    }
    fun by_price(self, min_p, max_p) {
        return filter(fun(p)->p.final_price()>=min_p and p.final_price()<=max_p,
                      values(self.products))
    }
    fun top_rated(self, n) {
        let prods = sorted(values(self.products), true)
        return prods.slice(0, n)
    }
    fun in_stock(self) {
        return filter(fun(p)->p.in_stock(), values(self.products))
    }
    fun display_all(self) {
        print("=== Product Catalog (" + str(len(self.products)) + " items) ===")
        for p in values(self.products) { p.display() }
    }
}
