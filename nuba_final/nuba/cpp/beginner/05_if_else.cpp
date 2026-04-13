// Beginner: If-Else Statements
#include <iostream>
using namespace std;

int main() {
    int score = 85;

    if (score >= 90) {
        cout << "Grade: A" << endl;
    } else if (score >= 80) {
        cout << "Grade: B" << endl;
    } else if (score >= 70) {
        cout << "Grade: C" << endl;
    } else if (score >= 60) {
        cout << "Grade: D" << endl;
    } else {
        cout << "Grade: F" << endl;
    }

    // Ternary operator
    string result = (score >= 60) ? "Pass" : "Fail";
    cout << "Result: " << result << endl;
    return 0;
}
