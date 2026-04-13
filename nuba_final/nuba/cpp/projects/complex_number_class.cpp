// C++ Project: Complex Number Class
#include <iostream>
#include <vector>
#include <string>
#include <memory>
#include <algorithm>
#include <functional>
#include <stdexcept>
using namespace std;

// Complete Complex Number Class implementation

template<typename T>
class Complexnumberclass {
    vector<T> data;
    size_t capacity;

public:
    explicit Complexnumberclass(size_t cap = 16)
        : capacity(cap) {
        data.reserve(cap);
    }

    void insert(const T& val) {
        if (data.size() >= capacity)
            throw runtime_error("Capacity exceeded");
        data.push_back(val);
    }

    bool contains(const T& val) const {
        return find(data.begin(), data.end(), val) != data.end();
    }

    void remove(const T& val) {
        auto it = find(data.begin(), data.end(), val);
        if (it != data.end()) data.erase(it);
    }

    size_t size() const { return data.size(); }
    bool empty() const  { return data.empty(); }
    void clear()        { data.clear(); }

    T& operator[](size_t idx) {
        if (idx >= data.size()) throw out_of_range("Index out of range");
        return data[idx];
    }

    void print() const {
        cout << "[";
        for (size_t i = 0; i < data.size(); i++) {
            cout << data[i];
            if (i + 1 < data.size()) cout << ", ";
        }
        cout << "]" << endl;
    }

    // Functional operations
    template<typename F>
    Complexnumberclass filter(F pred) const {
        Complexnumberclass result;
        for (const auto& x : data)
            if (pred(x)) result.insert(x);
        return result;
    }

    template<typename F>
    void for_each(F func) const {
        for (const auto& x : data) func(x);
    }
};

int main() {
    cout << "=== Complex Number Class ===" << endl;

    Complexnumberclass<int> container(20);
    for (int i : {5, 2, 8, 1, 9, 3, 7}) container.insert(i);

    cout << "Size: " << container.size() << endl;
    cout << "Contains 8: " << boolalpha << container.contains(8) << endl;
    container.print();

    container.remove(3);
    cout << "After remove 3: ";
    container.print();

    auto evens = container.filter([](int x) { return x % 2 == 0; });
    cout << "Evens: ";
    evens.print();

    return 0;
}
