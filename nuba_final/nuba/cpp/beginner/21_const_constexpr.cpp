// Beginner C++: 21 Const Constexpr

#include <iostream>
using namespace std;

const double PI = 3.14159265358979;
constexpr int MAX_SIZE = 1000;
constexpr int square(int x) { return x * x; }

int main() {
    const int n = 42;
    cout << "PI = " << PI << endl;
    cout << "MAX_SIZE = " << MAX_SIZE << endl;
    cout << "square(7) = " << square(7) << endl;
    cout << "n = " << n << endl;

    // const pointer vs pointer to const
    int x = 10, y = 20;
    const int* ptr1 = &x;  // can't modify *ptr1
    int* const ptr2 = &x;  // can't modify ptr2
    ptr1 = &y;             // OK
    *ptr2 = 15;            // OK
    cout << "x = " << x << endl;
    return 0;
}
