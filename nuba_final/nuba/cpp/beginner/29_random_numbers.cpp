// Beginner: Random Numbers
#include <iostream>
#include <random>
#include <ctime>
using namespace std;
int main() {
    // C++ random library
    random_device rd;
    mt19937 gen(rd());
    uniform_int_distribution<> dis(1, 100);
    uniform_real_distribution<> fdis(0.0, 1.0);
    normal_distribution<> ndis(50.0, 10.0);

    cout << "5 random integers (1-100): ";
    for (int i = 0; i < 5; i++) cout << dis(gen) << " ";
    cout << endl;

    cout << "5 random floats (0-1): ";
    for (int i = 0; i < 5; i++) cout << fdis(gen) << " ";
    cout << endl;

    cout << "5 normal distribution values: ";
    for (int i = 0; i < 5; i++) cout << (int)ndis(gen) << " ";
    cout << endl;
    return 0;
}
