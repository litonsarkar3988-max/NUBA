# Restaurant: Point of Sale System
class POS {
    fun init(self, terminal_id, location) {
        self.terminal_id  = terminal_id
        self.location     = location
        self.transactions = []
        self.daily_total  = 0
        self.cash_drawer  = 500.0
    }
    fun process_payment(self, order_id, amount, method, tendered) {
        let change = 0
        if method == "CASH" {
            if tendered < amount { throw "Insufficient cash tendered" }
            change = round(tendered - amount, 2)
            self.cash_drawer += amount - change
        }
        let txn = {
            "order_id": order_id,
            "amount":   amount,
            "method":   method,
            "change":   change
        }
        push(self.transactions, txn)
        self.daily_total += amount
        print(format("Payment: ${0} via {1} | Change: ${2}", amount, method, change))
        return txn
    }
    fun print_receipt(self, txn) {
        print("=== Receipt ===")
        print("Terminal:", self.terminal_id)
        print("Order #" + str(txn["order_id"]))
        print("Amount: $" + str(txn["amount"]))
        print("Paid via:", txn["method"])
        if txn["change"] > 0 { print("Change: $" + str(txn["change"])) }
        print("Thank you for dining with us!")
    }
    fun daily_report(self) {
        print("=== Daily POS Report ===")
        print("Terminal:", self.terminal_id)
        print("Transactions:", len(self.transactions))
        print("Daily Total: $" + str(round(self.daily_total,2)))
        print("Cash in Drawer: $" + str(round(self.cash_drawer,2)))
        let by_method = {}
        for t in self.transactions {
            let m = t["method"]
            if not has(by_method, m) { by_method[m] = 0 }
            by_method[m] += t["amount"]
        }
        print("By Payment Method:")
        for pair in items(by_method) {
            print("  " + pair[0] + ": $" + str(round(pair[1],2)))
        }
    }
}
let pos = new POS("POS-01", "Main Counter")
let t1 = pos.process_payment(101, 45.50, "CASH", 50.00)
let t2 = pos.process_payment(102, 32.75, "CARD", 32.75)
let t3 = pos.process_payment(103, 78.90, "CASH", 100.00)
pos.print_receipt(t1)
print()
pos.daily_report()
