// Templates: Non Type Params
#include <iostream>
#include <type_traits>
#include <string>
#include <vector>
using namespace std;

// Non Type Params demonstration

// Basic template
template<typename T>
T identity(T val) { return val; }

// Specialized template
template<>
string identity<string>(string val) { return "[" + val + "]"; }

// Template with constraint
template<typename T>
requires arithmetic<T>
T square(T x) { return x * x; }

// Template class
template<typename T, size_t N>
class FixedArray {
    T data[N];
    size_t sz = 0;
public:
    void push(const T& v) { if (sz < N) data[sz++] = v; }
    T& operator[](size_t i) { return data[i]; }
    size_t size() const { return sz; }
    void print() const {
        for (size_t i = 0; i < sz; i++) {
            cout << data[i];
            if (i + 1 < sz) cout << ", ";
        }
        cout << endl;
    }
};

int main() {
    cout << "=== Non Type Params ===" << endl;

    cout << identity(42) << endl;
    cout << identity(3.14) << endl;
    cout << identity(string("hello")) << endl;

    FixedArray<int, 10> arr;
    for (int i : {1,2,3,4,5}) arr.push(i);
    arr.print();

    return 0;
}
