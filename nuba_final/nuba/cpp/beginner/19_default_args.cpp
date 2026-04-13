// Beginner C++: 19 Default Args

#include <iostream>
#include <string>
using namespace std;

void greet(string name, string greeting = "Hello", string punctuation = "!") {
    cout << greeting << ", " << name << punctuation << endl;
}

double power(double base, int exp = 2) {
    double result = 1;
    for (int i = 0; i < exp; i++) result *= base;
    return result;
}

int main() {
    greet("Alice");
    greet("Bob", "Hi");
    greet("Carol", "Hey", ".");
    cout << power(3)    << endl;  // 9
    cout << power(2, 10) << endl; // 1024
    return 0;
}
