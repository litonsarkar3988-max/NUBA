// Beginner C++: 09 Do While

#include <iostream>
using namespace std;

int main() {
    int n;
    do {
        cout << "Enter a positive number (0 to quit): ";
        n = 5; // Simulated input
        cout << n << endl;
        cout << "Square: " << n * n << endl;
        n = 0; // exit
    } while (n != 0);
    cout << "Done!" << endl;
    return 0;
}
