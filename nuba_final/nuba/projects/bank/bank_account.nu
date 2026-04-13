# Project: Bank Account System
class BankAccount {
    fun init(self, owner, balance) {
        self.owner   = owner
        self.balance = balance
        self.history = []
        self._log("Account opened", balance)
    }
    fun _log(self, action, amount) {
        push(self.history, {"action": action, "amount": amount, "balance": self.balance})
    }
    fun deposit(self, amount) {
        if amount <= 0 { throw "Deposit must be positive" }
        self.balance += amount
        self._log("Deposit", amount)
        return self
    }
    fun withdraw(self, amount) {
        if amount <= 0 { throw "Withdrawal must be positive" }
        if amount > self.balance { throw "Insufficient funds" }
        self.balance -= amount
        self._log("Withdrawal", amount)
        return self
    }
    fun transfer(self, other, amount) {
        self.withdraw(amount)
        other.deposit(amount)
        return self
    }
    fun statement(self) {
        print("=== Statement for", self.owner, "===")
        for entry in self.history {
            print(format("  {0:15} | Amount: {1:8} | Balance: {2}",
                         entry["action"], entry["amount"], entry["balance"]))
        }
        print("Current balance: $" + str(self.balance))
    }
}
let alice = new BankAccount("Alice", 1000)
let bob   = new BankAccount("Bob", 500)
alice.deposit(500).deposit(200)
alice.withdraw(300)
alice.transfer(bob, 400)
alice.statement()
print()
bob.statement()
