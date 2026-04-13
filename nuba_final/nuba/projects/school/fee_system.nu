# School: Fee Management System
class FeeStructure {
    fun init(self, grade, tuition, lab, sports, library) {
        self.grade   = grade
        self.tuition = tuition
        self.lab     = lab
        self.sports  = sports
        self.library = library
    }
    fun total(self) { return self.tuition + self.lab + self.sports + self.library }
}
class FeeRecord {
    fun init(self, student_id, name, fee_structure) {
        self.student_id  = student_id
        self.name        = name
        self.fee         = fee_structure
        self.paid        = 0
        self.payments    = []
    }
    fun pay(self, amount, date, mode) {
        self.paid += amount
        push(self.payments, {"amount":amount,"date":date,"mode":mode})
        print(format("Payment received: ${0} from {1} via {2}", amount, self.name, mode))
        return self
    }
    fun balance(self)    { return self.fee.total() - self.paid }
    fun is_clear(self)   { return self.balance() <= 0 }
    fun statement(self) {
        print("=== Fee Statement:", self.name, "===")
        print("Annual Fee:", self.fee.total())
        print("  Tuition:", self.fee.tuition)
        print("  Lab:",     self.fee.lab)
        print("  Sports:",  self.fee.sports)
        print("  Library:", self.fee.library)
        print("Total Paid:", self.paid)
        print("Balance:", self.balance())
        print("Status:", "CLEARED" if self.is_clear() else "DUE")
    }
}
let grade10_fees = new FeeStructure("Grade 10", 5000, 500, 300, 200)
let alice_fees   = new FeeRecord("S001", "Alice", grade10_fees)
alice_fees.pay(3000,"2024-01-15","Online").pay(2000,"2024-03-10","Cash")
alice_fees.statement()
