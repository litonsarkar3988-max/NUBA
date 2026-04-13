// OOP: Inheritance
#include <iostream>
#include <string>
#include <cmath>
using namespace std;

class Shape {
protected:
    string color;
public:
    Shape(const string& c) : color(c) {}
    virtual double area() const = 0;
    virtual double perimeter() const = 0;
    virtual string name() const = 0;
    virtual void describe() const {
        cout << name() << " (" << color << ")"
             << " | Area: " << area()
             << " | Perimeter: " << perimeter() << endl;
    }
    virtual ~Shape() {}
};

class Circle : public Shape {
    double radius;
public:
    Circle(const string& c, double r) : Shape(c), radius(r) {}
    double area() const override { return M_PI * radius * radius; }
    double perimeter() const override { return 2 * M_PI * radius; }
    string name() const override { return "Circle"; }
};

class Rectangle : public Shape {
    double width, height;
public:
    Rectangle(const string& c, double w, double h)
        : Shape(c), width(w), height(h) {}
    double area() const override { return width * height; }
    double perimeter() const override { return 2 * (width + height); }
    string name() const override { return "Rectangle"; }
};

class Triangle : public Shape {
    double a, b, c;
public:
    Triangle(const string& col, double a, double b, double c)
        : Shape(col), a(a), b(b), c(c) {}
    double perimeter() const override { return a + b + c; }
    double area() const override {
        double s = perimeter() / 2;
        return sqrt(s * (s-a) * (s-b) * (s-c));
    }
    string name() const override { return "Triangle"; }
};

int main() {
    Shape* shapes[] = {
        new Circle("red", 5),
        new Rectangle("blue", 4, 6),
        new Triangle("green", 3, 4, 5)
    };
    for (auto* s : shapes) { s->describe(); delete s; }
    return 0;
}
