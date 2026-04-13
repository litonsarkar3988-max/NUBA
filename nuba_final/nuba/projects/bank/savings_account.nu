# Project: Savings Account with Interest
class SavingsAccount {
    fun init(self, owner, balance, interest_rate) {
        self.owner         = owner
        self.balance       = balance
        self.interest_rate = interest_rate
        self.months        = 0
    }
    fun deposit(self, amount) { self.balance += amount; return self }
    fun apply_interest(self) {
        let interest = self.balance * self.interest_rate / 100
        self.balance += interest
        self.months += 1
        print(format("Month {0}: +${1} interest | Balance: ${2}",
                     self.months, round(interest,2), round(self.balance,2)))
        return self
    }
    fun grow(self, n_months) {
        for i in 0..n_months { self.apply_interest() }
        return self
    }
}
let acc = new SavingsAccount("Carol", 5000, 1.5)
acc.deposit(1000)
acc.grow(12)
print("Final balance after 1 year: $" + str(round(acc.balance, 2)))
