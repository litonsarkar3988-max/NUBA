// Advanced C++: Variadic Templates
#include <iostream>
using namespace std;

// Base case
void print() { cout << endl; }

// Variadic template
template<typename T, typename... Args>
void print(T first, Args... rest) {
    cout << first << " ";
    print(rest...);
}

template<typename... Args>
auto sum(Args... args) { return (args + ...); }  // fold expression

template<typename... Args>
auto product(Args... args) { return (args * ...); }

template<typename T>
T max_of(T a, T b) { return a > b ? a : b; }

template<typename T, typename... Args>
T max_of(T a, Args... rest) { return max_of(a, max_of(rest...)); }

int main() {
    print(1, "hello", 3.14, true, 'x');
    cout << "Sum: " << sum(1, 2, 3, 4, 5) << endl;
    cout << "Product: " << product(1, 2, 3, 4, 5) << endl;
    cout << "Max: " << max_of(3, 1, 4, 1, 5, 9, 2, 6) << endl;
    return 0;
}
