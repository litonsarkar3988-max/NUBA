// Beginner C++: 16 References

#include <iostream>
using namespace std;

void swap_values(int& a, int& b) {
    int temp = a; a = b; b = temp;
}

void increment(int& n, int by = 1) { n += by; }

int main() {
    int a = 10, b = 20;
    cout << "Before: a=" << a << ", b=" << b << endl;
    swap_values(a, b);
    cout << "After swap: a=" << a << ", b=" << b << endl;

    int x = 5;
    increment(x);
    increment(x, 10);
    cout << "x after increments: " << x << endl;
    return 0;
}
