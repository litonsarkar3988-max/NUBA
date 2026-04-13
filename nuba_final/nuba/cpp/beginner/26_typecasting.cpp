// Beginner C++: 26 Typecasting

#include <iostream>
using namespace std;

int main() {
    // Implicit conversion
    int i = 42;
    double d = i;
    cout << "int to double: " << d << endl;

    // Explicit cast
    double pi = 3.14159;
    int pi_int = (int)pi;
    cout << "double to int: " << pi_int << endl;

    // static_cast
    int x = 7, y = 2;
    cout << "int div: " << x/y << endl;
    cout << "double div: " << static_cast<double>(x)/y << endl;

    // char and int
    char c = 'A';
    cout << "char 'A' as int: " << static_cast<int>(c) << endl;
    cout << "int 66 as char: " << static_cast<char>(66) << endl;
    return 0;
}
