// Beginner: Const and Constexpr
#include <iostream>
using namespace std;
constexpr int MAX_SIZE = 100;
constexpr double PI = 3.14159265358979;
constexpr int factorial(int n) {
    return (n <= 1) ? 1 : n * factorial(n-1);
}
int main() {
    const int x = 42;
    cout << "MAX_SIZE: " << MAX_SIZE << endl;
    cout << "PI: " << PI << endl;
    cout << "constexpr factorial(5): " << factorial(5) << endl;
    int arr[MAX_SIZE];
    arr[0] = x;
    cout << "Array first element: " << arr[0] << endl;
    return 0;
}
