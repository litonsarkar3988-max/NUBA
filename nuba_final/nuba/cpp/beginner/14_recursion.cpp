// Beginner: Recursion
#include <iostream>
using namespace std;

int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n-1) + fibonacci(n-2);
}

int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n-1);
}

int gcd(int a, int b) {
    if (b == 0) return a;
    return gcd(b, a % b);
}

void print_binary(int n) {
    if (n > 1) print_binary(n / 2);
    cout << n % 2;
}

int sum_of_digits(int n) {
    if (n == 0) return 0;
    return n % 10 + sum_of_digits(n / 10);
}

int main() {
    cout << "Fibonacci(10) = " << fibonacci(10) << endl;
    cout << "Factorial(10) = " << factorial(10) << endl;
    cout << "GCD(48, 18) = " << gcd(48, 18) << endl;
    cout << "Binary of 42: "; print_binary(42); cout << endl;
    cout << "Digit sum of 12345 = " << sum_of_digits(12345) << endl;
    return 0;
}
