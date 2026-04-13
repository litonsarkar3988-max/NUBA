// Beginner: Input and Output
#include <iostream>
#include <string>
using namespace std;

int main() {
    string name;
    int age;
    double salary;

    cout << "Enter your name: ";
    cin >> name;
    cout << "Enter your age: ";
    cin >> age;
    cout << "Enter your salary: ";
    cin >> salary;

    cout << "\nHello, " << name << "!" << endl;
    cout << "You are " << age << " years old." << endl;
    cout << "Your salary is $" << salary << endl;
    return 0;
}
