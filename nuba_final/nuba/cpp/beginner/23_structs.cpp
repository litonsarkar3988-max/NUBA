// Beginner C++: 23 Structs

#include <iostream>
#include <string>
using namespace std;

struct Point {
    double x, y;
    double distance_from_origin() const {
        return sqrt(x*x + y*y);
    }
};

struct Rectangle {
    Point top_left, bottom_right;
    double width()  const { return bottom_right.x - top_left.x; }
    double height() const { return bottom_right.y - top_left.y; }
    double area()   const { return width() * height(); }
    double perimeter() const { return 2 * (width() + height()); }
};

struct Student {
    string name;
    int    id;
    double gpa;
};

int main() {
    Point p = {3.0, 4.0};
    cout << "Distance from origin: " << p.distance_from_origin() << endl;

    Rectangle r = {{0,0},{10,5}};
    cout << "Area: " << r.area() << ", Perimeter: " << r.perimeter() << endl;

    Student s = {"Alice", 1001, 3.85};
    cout << s.name << " (ID:" << s.id << ") GPA:" << s.gpa << endl;
    return 0;
}
