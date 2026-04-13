// Beginner C++: 17 Recursion

#include <iostream>
using namespace std;

int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n-1) + fibonacci(n-2);
}

int gcd(int a, int b) {
    return b == 0 ? a : gcd(b, a % b);
}

int main() {
    for (int i = 0; i <= 10; i++)
        cout << i << "! = " << factorial(i) << endl;

    cout << "Fibonacci: ";
    for (int i = 0; i < 10; i++)
        cout << fibonacci(i) << " ";
    cout << endl;

    cout << "GCD(48,18) = " << gcd(48, 18) << endl;
    return 0;
}
