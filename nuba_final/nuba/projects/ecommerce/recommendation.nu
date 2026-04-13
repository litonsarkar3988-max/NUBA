# E-Commerce: Recommendation Engine
class RecommendationEngine {
    fun init(self) {
        self.purchase_history = {}
        self.product_views    = {}
        self.co_purchases     = {}
    }
    fun record_purchase(self, user, product_id) {
        if not has(self.purchase_history, user) {
            self.purchase_history[user] = []
        }
        push(self.purchase_history[user], product_id)
        self._update_co_purchases(user, product_id)
    }
    fun record_view(self, user, product_id) {
        if not has(self.product_views, product_id) {
            self.product_views[product_id] = 0
        }
        self.product_views[product_id] += 1
    }
    fun _update_co_purchases(self, user, new_product) {
        if not has(self.purchase_history, user) { return }
        for prev in self.purchase_history[user] {
            if prev != new_product {
                let key = prev + "," + new_product
                if not has(self.co_purchases, key) { self.co_purchases[key] = 0 }
                self.co_purchases[key] += 1
            }
        }
    }
    fun recommend(self, user, n) {
        if not has(self.purchase_history, user) { return [] }
        let purchased = self.purchase_history[user]
        let scores = {}
        for p_id in purchased {
            for pair in items(self.co_purchases) {
                let parts = split(pair[0], ",")
                if parts[0] == p_id and not purchased.contains(parts[1]) {
                    if not has(scores, parts[1]) { scores[parts[1]] = 0 }
                    scores[parts[1]] += pair[1]
                }
            }
        }
        let ranked = sorted(items(scores), true)
        let result = []
        for i in 0..min([n, len(ranked)]) { push(result, ranked[i][0]) }
        return result
    }
    fun popular(self, n) {
        let ranked = sorted(items(self.product_views), true)
        let result = []
        for i in 0..min([n, len(ranked)]) { push(result, ranked[i][0]) }
        return result
    }
}

let engine = new RecommendationEngine()
engine.record_view("alice", "P001")
engine.record_view("alice", "P002")
engine.record_view("bob",   "P002")
engine.record_view("bob",   "P003")
engine.record_purchase("alice", "P001")
engine.record_purchase("alice", "P002")
engine.record_purchase("bob",   "P002")
engine.record_purchase("bob",   "P003")
engine.record_purchase("carol", "P001")
engine.record_purchase("carol", "P003")

print("Recommendations for alice:", engine.recommend("alice", 3))
print("Most popular:", engine.popular(3))
