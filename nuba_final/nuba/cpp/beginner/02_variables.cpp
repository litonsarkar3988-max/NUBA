// Beginner: Variables and Data Types
#include <iostream>
#include <string>
using namespace std;

int main() {
    int age = 25;
    double pi = 3.14159;
    char grade = 'A';
    string name = "Nuba";
    bool is_active = true;

    cout << "Name: " << name << endl;
    cout << "Age: " << age << endl;
    cout << "Pi: " << pi << endl;
    cout << "Grade: " << grade << endl;
    cout << "Active: " << boolalpha << is_active << endl;
    return 0;
}
