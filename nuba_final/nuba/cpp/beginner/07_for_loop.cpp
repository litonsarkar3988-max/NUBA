// Beginner: For Loop
#include <iostream>
using namespace std;

int main() {
    // Basic for loop
    cout << "1 to 10: ";
    for (int i = 1; i <= 10; i++) {
        cout << i << " ";
    }
    cout << endl;

    // Sum using for loop
    int sum = 0;
    for (int i = 1; i <= 100; i++) sum += i;
    cout << "Sum 1-100: " << sum << endl;

    // Multiplication table
    int n = 7;
    cout << "Table of " << n << ":" << endl;
    for (int i = 1; i <= 10; i++) {
        cout << n << " x " << i << " = " << n * i << endl;
    }
    return 0;
}
