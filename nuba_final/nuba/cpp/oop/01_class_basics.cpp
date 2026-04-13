// OOP: Class Basics
#include <iostream>
#include <string>
using namespace std;

class BankAccount {
private:
    string owner;
    double balance;
    int account_id;
    static int next_id;

public:
    BankAccount(const string& owner, double initial)
        : owner(owner), balance(initial), account_id(next_id++) {}

    void deposit(double amount) {
        if (amount > 0) balance += amount;
    }
    bool withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
            return true;
        }
        return false;
    }
    double get_balance() const { return balance; }
    string get_owner() const   { return owner; }
    int get_id() const         { return account_id; }

    void print() const {
        cout << "Account #" << account_id << " | "
             << owner << " | Balance: $" << balance << endl;
    }
};

int BankAccount::next_id = 1001;

int main() {
    BankAccount a1("Alice", 1000.0);
    BankAccount a2("Bob", 500.0);
    a1.deposit(500);
    a1.withdraw(200);
    a2.deposit(300);
    a1.print();
    a2.print();
    return 0;
}
