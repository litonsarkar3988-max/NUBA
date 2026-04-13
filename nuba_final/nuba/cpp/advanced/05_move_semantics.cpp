// Advanced C++: Move Semantics
#include <iostream>
#include <string>
#include <vector>
#include <utility>
using namespace std;

class Resource {
    int* data;
    size_t size;
public:
    Resource(size_t n) : size(n), data(new int[n]) {
        for (size_t i = 0; i < n; i++) data[i] = i;
        cout << "Constructed (size=" << n << ")" << endl;
    }
    // Copy constructor
    Resource(const Resource& other) : size(other.size), data(new int[other.size]) {
        copy(other.data, other.data + size, data);
        cout << "Copied" << endl;
    }
    // Move constructor
    Resource(Resource&& other) noexcept : size(other.size), data(other.data) {
        other.data = nullptr;
        other.size = 0;
        cout << "Moved" << endl;
    }
    // Move assignment
    Resource& operator=(Resource&& other) noexcept {
        if (this != &other) {
            delete[] data;
            data = other.data;
            size = other.size;
            other.data = nullptr;
            other.size = 0;
        }
        return *this;
    }
    ~Resource() { delete[] data; cout << "Destroyed" << endl; }
    size_t get_size() const { return size; }
};

int main() {
    cout << "--- Create ---" << endl;
    Resource r1(5);
    cout << "--- Copy ---" << endl;
    Resource r2 = r1;
    cout << "--- Move ---" << endl;
    Resource r3 = move(r1);
    cout << "r1 size: " << r1.get_size() << endl;
    cout << "r3 size: " << r3.get_size() << endl;
    cout << "--- Cleanup ---" << endl;
    return 0;
}
