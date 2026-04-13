// Beginner: Math Functions
#include <iostream>
#include <cmath>
#include <iomanip>
using namespace std;
int main() {
    cout << fixed << setprecision(4);
    cout << "sqrt(144) = " << sqrt(144) << endl;
    cout << "pow(2, 10) = " << pow(2, 10) << endl;
    cout << "abs(-42) = " << abs(-42) << endl;
    cout << "floor(3.9) = " << floor(3.9) << endl;
    cout << "ceil(3.1) = " << ceil(3.1) << endl;
    cout << "round(3.5) = " << round(3.5) << endl;
    cout << "log(M_E) = " << log(M_E) << endl;
    cout << "log10(100) = " << log10(100) << endl;
    cout << "sin(PI/2) = " << sin(M_PI/2) << endl;
    cout << "cos(0) = " << cos(0) << endl;
    cout << "tan(PI/4) = " << tan(M_PI/4) << endl;
    cout << "M_PI = " << M_PI << endl;
    return 0;
}
