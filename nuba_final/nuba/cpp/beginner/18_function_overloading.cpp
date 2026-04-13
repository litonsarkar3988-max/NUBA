// Beginner C++: 18 Function Overloading

#include <iostream>
#include <string>
using namespace std;

int    add(int a, int b)       { return a + b; }
double add(double a, double b) { return a + b; }
string add(string a, string b) { return a + b; }

void print(int x)    { cout << "int: " << x << endl; }
void print(double x) { cout << "double: " << x << endl; }
void print(string x) { cout << "string: " << x << endl; }

int main() {
    cout << add(3, 4) << endl;
    cout << add(3.14, 2.72) << endl;
    cout << add(string("Hello "), string("World")) << endl;
    print(42);
    print(3.14);
    print(string("Nuba"));
    return 0;
}
