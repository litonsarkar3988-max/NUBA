// C++ OOP: 03 Inheritance

#include <iostream>
#include <string>
using namespace std;

class Shape {
protected:
    string color;
public:
    Shape(string c) : color(c) {}
    virtual double area()      const = 0;
    virtual double perimeter() const = 0;
    virtual void   describe()  const {
        cout << color << " shape - Area: " << area()
             << ", Perimeter: " << perimeter() << endl;
    }
    virtual ~Shape() {}
};

class Circle : public Shape {
    double radius;
public:
    Circle(string c, double r) : Shape(c), radius(r) {}
    double area()      const override { return 3.14159 * radius * radius; }
    double perimeter() const override { return 2 * 3.14159 * radius; }
    void   describe()  const override {
        cout << color << " Circle(r=" << radius << "): ";
        Shape::describe();
    }
};

class Rectangle : public Shape {
    double width, height;
public:
    Rectangle(string c, double w, double h) : Shape(c), width(w), height(h) {}
    double area()      const override { return width * height; }
    double perimeter() const override { return 2*(width+height); }
};

class Triangle : public Shape {
    double a, b, c;
public:
    Triangle(string col, double a, double b, double c)
        : Shape(col), a(a), b(b), c(c) {}
    double area() const override {
        double s = (a+b+c)/2;
        return sqrt(s*(s-a)*(s-b)*(s-c));
    }
    double perimeter() const override { return a+b+c; }
};

int main() {
    Shape* shapes[] = {
        new Circle("Red", 5),
        new Rectangle("Blue", 4, 6),
        new Triangle("Green", 3, 4, 5)
    };
    for (auto* s : shapes) { s->describe(); delete s; }
    return 0;
}
