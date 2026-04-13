// C++ OOP: 07 Abstract Classes

#include <iostream>
#include <string>
#include <vector>
using namespace std;

class ISerializable {
public:
    virtual string serialize() const = 0;
    virtual ~ISerializable() {}
};

class IComparable {
public:
    virtual int compare_to(const IComparable& other) const = 0;
    virtual ~IComparable() {}
};

class Employee : public ISerializable, public IComparable {
protected:
    string name;
    int    id;
    double salary;
public:
    Employee(string n, int i, double s) : name(n), id(i), salary(s) {}
    virtual double annual_bonus() const = 0;
    virtual string department()   const = 0;

    string serialize() const override {
        return "Employee{id=" + to_string(id) + ",name=" + name +
               ",salary=" + to_string(salary) + "}";
    }
    int compare_to(const IComparable& o) const override {
        const Employee& e = dynamic_cast<const Employee&>(o);
        return salary < e.salary ? -1 : (salary > e.salary ? 1 : 0);
    }
    virtual void print() const {
        cout << department() << " - " << name << " ($" << salary
             << ", bonus: $" << annual_bonus() << ")" << endl;
    }
};

class Engineer : public Employee {
public:
    Engineer(string n, int i, double s) : Employee(n,i,s) {}
    double annual_bonus() const override { return salary * 0.15; }
    string department()   const override { return "Engineering"; }
};

class Manager : public Employee {
    int team_size;
public:
    Manager(string n, int i, double s, int ts)
        : Employee(n,i,s), team_size(ts) {}
    double annual_bonus() const override { return salary * 0.25 + team_size * 1000; }
    string department()   const override { return "Management"; }
};

int main() {
    vector<Employee*> employees = {
        new Engineer("Alice", 1, 95000),
        new Manager("Bob", 2, 120000, 8),
        new Engineer("Carol", 3, 88000),
        new Manager("Dave", 4, 110000, 5)
    };
    for (auto* e : employees) { e->print(); cout << e->serialize() << endl; }
    for (auto* e : employees) delete e;
    return 0;
}
