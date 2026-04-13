// Beginner C++: 28 Break Continue

#include <iostream>
using namespace std;

int main() {
    // break
    cout << "Break at 5: ";
    for (int i = 0; i < 10; i++) {
        if (i == 5) break;
        cout << i << " ";
    }
    cout << endl;

    // continue
    cout << "Skip evens: ";
    for (int i = 0; i < 10; i++) {
        if (i % 2 == 0) continue;
        cout << i << " ";
    }
    cout << endl;

    // Nested break
    cout << "Nested loops:" << endl;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (j == 2) break;
            cout << "(" << i << "," << j << ") ";
        }
        cout << endl;
    }
    return 0;
}
