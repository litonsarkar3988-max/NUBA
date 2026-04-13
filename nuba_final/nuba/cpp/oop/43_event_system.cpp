// OOP: Event System
#include <iostream>
#include <string>
#include <vector>
#include <memory>
#include <functional>
using namespace std;

// Event System Implementation

class Base {
protected:
    string name;
public:
    Base(const string& n) : name(n) {}
    virtual ~Base() {}
    virtual string describe() const { return "Base: " + name; }
    virtual void execute() { cout << describe() << endl; }
};

class Concrete : public Base {
    int value;
public:
    Concrete(const string& n, int v) : Base(n), value(v) {}
    string describe() const override {
        return "Event System [" + name + "] value=" + to_string(value);
    }
};

class Manager {
    vector<shared_ptr<Base>> items;
public:
    void add(shared_ptr<Base> item) { items.push_back(item); }
    void execute_all() {
        for (auto& item : items) item->execute();
    }
    size_t count() const { return items.size(); }
};

int main() {
    Manager mgr;
    for (int i = 1; i <= 5; i++) {
        mgr.add(make_shared<Concrete>("Event System_" + to_string(i), i * 10));
    }
    cout << "=== Event System Demo ===" << endl;
    cout << "Items: " << mgr.count() << endl;
    mgr.execute_all();
    return 0;
}
