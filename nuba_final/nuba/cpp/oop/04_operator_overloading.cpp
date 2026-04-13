// OOP: Operator Overloading
#include <iostream>
#include <cmath>
using namespace std;

class Vector2D {
public:
    double x, y;
    Vector2D(double x = 0, double y = 0) : x(x), y(y) {}

    Vector2D operator+(const Vector2D& v) const { return {x+v.x, y+v.y}; }
    Vector2D operator-(const Vector2D& v) const { return {x-v.x, y-v.y}; }
    Vector2D operator*(double s) const { return {x*s, y*s}; }
    double   operator*(const Vector2D& v) const { return x*v.x + y*v.y; } // dot
    bool     operator==(const Vector2D& v) const { return x==v.x && y==v.y; }
    Vector2D& operator+=(const Vector2D& v) { x+=v.x; y+=v.y; return *this; }

    double magnitude() const { return sqrt(x*x + y*y); }
    Vector2D normalize() const {
        double m = magnitude();
        return {x/m, y/m};
    }

    friend ostream& operator<<(ostream& os, const Vector2D& v) {
        os << "(" << v.x << ", " << v.y << ")";
        return os;
    }
};

class Complex {
public:
    double real, imag;
    Complex(double r = 0, double i = 0) : real(r), imag(i) {}
    Complex operator+(const Complex& c) const { return {real+c.real, imag+c.imag}; }
    Complex operator*(const Complex& c) const {
        return {real*c.real - imag*c.imag, real*c.imag + imag*c.real};
    }
    double magnitude() const { return sqrt(real*real + imag*imag); }
    friend ostream& operator<<(ostream& os, const Complex& c) {
        os << c.real << (c.imag >= 0 ? "+" : "") << c.imag << "i";
        return os;
    }
};

int main() {
    Vector2D v1(3, 4), v2(1, 2);
    cout << "v1 = " << v1 << endl;
    cout << "v2 = " << v2 << endl;
    cout << "v1 + v2 = " << (v1 + v2) << endl;
    cout << "|v1| = " << v1.magnitude() << endl;
    cout << "v1 . v2 = " << (v1 * v2) << endl;

    Complex c1(3, 4), c2(1, -2);
    cout << "c1 = " << c1 << endl;
    cout << "c1 + c2 = " << (c1 + c2) << endl;
    cout << "c1 * c2 = " << (c1 * c2) << endl;
    return 0;
}
