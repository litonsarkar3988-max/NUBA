// Beginner: Structures
#include <iostream>
#include <string>
using namespace std;

struct Point {
    double x, y;
};

struct Student {
    string name;
    int id;
    double gpa;
    void print() {
        cout << "Student: " << name << " | ID: " << id << " | GPA: " << gpa << endl;
    }
};

struct Rectangle {
    double width, height;
    double area()      { return width * height; }
    double perimeter() { return 2 * (width + height); }
};

double distance(Point a, Point b) {
    double dx = a.x - b.x, dy = a.y - b.y;
    return sqrt(dx*dx + dy*dy);
}

int main() {
    Point p1 = {3.0, 4.0}, p2 = {0.0, 0.0};
    cout << "Distance: " << distance(p1, p2) << endl;

    Student s = {"Alice", 1001, 3.85};
    s.print();

    Rectangle r = {8.0, 5.0};
    cout << "Area: " << r.area() << ", Perimeter: " << r.perimeter() << endl;
    return 0;
}
