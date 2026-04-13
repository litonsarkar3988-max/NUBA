// C++ OOP: 02 Constructors

#include <iostream>
#include <string>
using namespace std;

class Student {
    string name;
    int    id;
    double gpa;
public:
    // Default constructor
    Student() : name("Unknown"), id(0), gpa(0.0) {
        cout << "Default constructor called" << endl;
    }
    // Parameterized constructor
    Student(string n, int i, double g) : name(n), id(i), gpa(g) {
        cout << "Parameterized constructor: " << name << endl;
    }
    // Copy constructor
    Student(const Student& other) : name(other.name), id(other.id), gpa(other.gpa) {
        cout << "Copy constructor: " << name << endl;
    }
    // Destructor
    ~Student() { cout << "Destructor: " << name << endl; }

    void print() const {
        cout << name << " (ID:" << id << ", GPA:" << gpa << ")" << endl;
    }
};

int main() {
    Student s1;
    Student s2("Alice", 1001, 3.85);
    Student s3 = s2;
    s1.print(); s2.print(); s3.print();
    return 0;
}
