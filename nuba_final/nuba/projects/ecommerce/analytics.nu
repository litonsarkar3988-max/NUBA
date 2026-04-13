# E-Commerce: Sales Analytics
class SalesAnalytics {
    fun init(self) {
        self.sales         = []
        self.daily_revenue = {}
        self.product_sales = {}
        self.category_rev  = {}
    }
    fun record(self, date, product_id, category, qty, unit_price) {
        let revenue = qty * unit_price
        push(self.sales, {
            "date":date,"product":product_id,"category":category,
            "qty":qty,"price":unit_price,"revenue":revenue
        })
        if not has(self.daily_revenue, date) { self.daily_revenue[date] = 0 }
        self.daily_revenue[date] += revenue
        if not has(self.product_sales, product_id) {
            self.product_sales[product_id] = {"qty":0,"revenue":0}
        }
        self.product_sales[product_id]["qty"]     += qty
        self.product_sales[product_id]["revenue"] += revenue
        if not has(self.category_rev, category) { self.category_rev[category] = 0 }
        self.category_rev[category] += revenue
    }
    fun total_revenue(self) { return round(sum(map(fun(s)->s["revenue"], self.sales)),2) }
    fun total_orders(self)  { return len(self.sales) }
    fun best_day(self) {
        let best = null
        let best_rev = 0
        for pair in items(self.daily_revenue) {
            if pair[1] > best_rev { best = pair[0]; best_rev = pair[1] }
        }
        return [best, round(best_rev, 2)]
    }
    fun top_products(self, n) {
        let pairs = items(self.product_sales)
        let sorted_p = sorted(pairs, true)
        return sorted_p.slice(0, n)
    }
    fun report(self) {
        print("=== Sales Analytics ===")
        print("Total Revenue: $" + str(self.total_revenue()))
        print("Total Transactions:", self.total_orders())
        let bd = self.best_day()
        print("Best Day:", bd[0], "($" + str(bd[1]) + ")")
        print("Revenue by Category:")
        for pair in items(self.category_rev) {
            print("  " + pair[0] + ": $" + str(round(pair[1],2)))
        }
    }
}

let analytics = new SalesAnalytics()
analytics.record("2024-01-01","LAPTOP","Electronics",3,999.99)
analytics.record("2024-01-01","MOUSE","Electronics",10,29.99)
analytics.record("2024-01-02","LAPTOP","Electronics",5,999.99)
analytics.record("2024-01-02","KEYBOARD","Electronics",8,79.99)
analytics.record("2024-01-03","SHIRT","Clothing",20,49.99)
analytics.record("2024-01-03","SHOES","Clothing",12,89.99)
analytics.report()
print("Top Products:", analytics.top_products(3))
