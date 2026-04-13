// Beginner: Functions
#include <iostream>
#include <cmath>
using namespace std;

// Function declarations
int add(int a, int b);
double circle_area(double r);
bool is_prime(int n);
int factorial(int n);

int main() {
    cout << "add(3, 4) = " << add(3, 4) << endl;
    cout << "circle_area(5) = " << circle_area(5) << endl;
    cout << "is_prime(17) = " << boolalpha << is_prime(17) << endl;
    cout << "factorial(10) = " << factorial(10) << endl;
    return 0;
}

int add(int a, int b) { return a + b; }

double circle_area(double r) { return M_PI * r * r; }

bool is_prime(int n) {
    if (n < 2) return false;
    for (int i = 2; i * i <= n; i++)
        if (n % i == 0) return false;
    return true;
}

int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}
