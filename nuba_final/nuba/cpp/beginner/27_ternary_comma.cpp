// Beginner C++: 27 Ternary Comma

#include <iostream>
using namespace std;

int main() {
    // Ternary operator
    int a = 10, b = 20;
    int max_val = (a > b) ? a : b;
    cout << "Max: " << max_val << endl;

    // Nested ternary
    int score = 75;
    string grade = (score>=90) ? "A" : (score>=80) ? "B" : (score>=70) ? "C" : "F";
    cout << "Grade: " << grade << endl;

    // Comma operator
    int x = (1, 2, 3);
    cout << "x = " << x << endl;

    // Sizeof
    cout << "sizeof(int) = " << sizeof(int) << endl;
    cout << "sizeof(double) = " << sizeof(double) << endl;
    cout << "sizeof(char) = " << sizeof(char) << endl;
    return 0;
}
