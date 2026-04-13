// C++ OOP Pattern 56: Value Object

#include <iostream>
#include <string>
#include <vector>
#include <memory>
using namespace std;

// Value Object Pattern Implementation

class Base {
protected:
    string name;
public:
    Base(string n = "Base") : name(n) {}
    virtual ~Base() {}
    virtual void execute() const { cout << "Base::execute() - " << name << endl; }
    virtual string type() const { return "Base"; }
};

class Derived : public Base {
    int extra;
public:
    Derived(string n, int e) : Base(n), extra(e) {}
    void execute() const override {
        cout << "Derived::execute() - " << name << " [extra=" << extra << "]" << endl;
    }
    string type() const override { return "Derived(value_object)"; }
};

int main() {
    // Demonstrate value object
    vector<unique_ptr<Base>> objects;
    objects.push_back(make_unique<Base>("obj1"));
    objects.push_back(make_unique<Derived>("obj2", 42));
    objects.push_back(make_unique<Derived>("obj3", 99));

    for (const auto& obj : objects) {
        obj->execute();
        cout << "  Type: " << obj->type() << endl;
    }
    return 0;
}
