// C++ OOP: 09 Smart Pointers

#include <iostream>
#include <memory>
#include <vector>
#include <string>
using namespace std;

class Resource {
    string name;
public:
    Resource(string n) : name(n) { cout << "Creating: " << name << endl; }
    ~Resource()                  { cout << "Destroying: " << name << endl; }
    void use() { cout << "Using: " << name << endl; }
    string get_name() const { return name; }
};

int main() {
    // unique_ptr
    {
        auto ptr1 = make_unique<Resource>("UniqueRes");
        ptr1->use();
        // auto ptr2 = ptr1;  // ERROR: can't copy unique_ptr
        auto ptr2 = move(ptr1);  // OK: move ownership
        ptr2->use();
    }  // ptr2 destroyed here

    cout << "---" << endl;

    // shared_ptr
    {
        auto shared1 = make_shared<Resource>("SharedRes");
        cout << "Use count: " << shared1.use_count() << endl;
        {
            auto shared2 = shared1;  // shared ownership
            cout << "Use count: " << shared1.use_count() << endl;
            shared2->use();
        }
        cout << "Use count after inner scope: " << shared1.use_count() << endl;
    }

    cout << "---" << endl;

    // Vector of unique_ptrs
    vector<unique_ptr<Resource>> resources;
    resources.push_back(make_unique<Resource>("R1"));
    resources.push_back(make_unique<Resource>("R2"));
    for (const auto& r : resources) r->use();
    return 0;
}
