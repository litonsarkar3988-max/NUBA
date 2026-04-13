// Beginner: While Loop
#include <iostream>
using namespace std;

int main() {
    // While loop
    int i = 1;
    int sum = 0;
    while (i <= 10) {
        sum += i;
        i++;
    }
    cout << "Sum 1-10: " << sum << endl;

    // Do-while loop
    int num = 1;
    do {
        cout << num << " ";
        num *= 2;
    } while (num <= 128);
    cout << endl;

    // Countdown
    int countdown = 5;
    while (countdown > 0) {
        cout << countdown << "... ";
        countdown--;
    }
    cout << "Blast off!" << endl;
    return 0;
}
