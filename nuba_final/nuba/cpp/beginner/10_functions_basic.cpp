// Beginner C++: 10 Functions Basic

#include <iostream>
using namespace std;

int add(int a, int b)      { return a + b; }
int subtract(int a, int b) { return a - b; }
int multiply(int a, int b) { return a * b; }
double divide(double a, double b) {
    if (b == 0) { cerr << "Division by zero!" << endl; return 0; }
    return a / b;
}

int main() {
    cout << "5 + 3 = " << add(5, 3)      << endl;
    cout << "5 - 3 = " << subtract(5, 3) << endl;
    cout << "5 * 3 = " << multiply(5, 3) << endl;
    cout << "5 / 3 = " << divide(5, 3)   << endl;
    return 0;
}
