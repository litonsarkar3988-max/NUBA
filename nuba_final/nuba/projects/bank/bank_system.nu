# Project: Multi-Account Bank System
class Bank {
    fun init(self, name) {
        self.name     = name
        self.accounts = {}
        self.next_id  = 1001
    }
    fun open_account(self, owner, initial_deposit) {
        let id = str(self.next_id)
        self.next_id += 1
        self.accounts[id] = {"owner": owner, "balance": initial_deposit, "id": id}
        print("Account opened:", id, "for", owner)
        return id
    }
    fun deposit(self, id, amount) {
        if not has(self.accounts, id) { throw "Account not found: " + id }
        self.accounts[id]["balance"] += amount
    }
    fun withdraw(self, id, amount) {
        if not has(self.accounts, id) { throw "Account not found: " + id }
        if self.accounts[id]["balance"] < amount { throw "Insufficient funds" }
        self.accounts[id]["balance"] -= amount
    }
    fun balance(self, id) {
        if not has(self.accounts, id) { throw "Account not found" }
        return self.accounts[id]["balance"]
    }
    fun report(self) {
        print("=== " + self.name + " Report ===")
        let total = 0
        for pair in items(self.accounts) {
            let acc = pair[1]
            print(format("  [{0}] {1}: ${2}", acc["id"], acc["owner"], acc["balance"]))
            total += acc["balance"]
        }
        print("Total deposits: $" + str(total))
    }
}
let bank = new Bank("Nuba National Bank")
let a1 = bank.open_account("Alice", 2000)
let a2 = bank.open_account("Bob", 1500)
let a3 = bank.open_account("Carol", 3000)
bank.deposit(a1, 500)
bank.withdraw(a2, 200)
bank.report()
