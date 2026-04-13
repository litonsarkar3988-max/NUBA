// C++ OOP: 10 Move Semantics

#include <iostream>
#include <string>
#include <vector>
using namespace std;

class BigData {
    vector<int> data;
    string      name;
public:
    BigData(string n, int size) : name(n) {
        data.resize(size, 0);
        cout << "Constructing " << name << " (size=" << size << ")" << endl;
    }
    // Copy constructor
    BigData(const BigData& other) : data(other.data), name(other.name+"_copy") {
        cout << "Copying " << other.name << " -> " << name << endl;
    }
    // Move constructor
    BigData(BigData&& other) noexcept
        : data(move(other.data)), name(move(other.name)) {
        name += "_moved";
        cout << "Moving resource" << endl;
    }
    // Move assignment
    BigData& operator=(BigData&& other) noexcept {
        if (this != &other) { data = move(other.data); name = move(other.name); }
        return *this;
    }
    ~BigData() { cout << "Destroying: " << name << " (size=" << data.size() << ")" << endl; }
    size_t size() const { return data.size(); }
    const string& get_name() const { return name; }
};

int main() {
    BigData a("A", 1000);
    BigData b(a);           // copy
    BigData c(move(a));     // move
    cout << "b: " << b.get_name() << " size=" << b.size() << endl;
    cout << "c: " << c.get_name() << " size=" << c.size() << endl;
    cout << "a: " << a.get_name() << " size=" << a.size() << endl;
    return 0;
}
