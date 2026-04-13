// C++ OOP: 06 Operator Overloading

#include <iostream>
#include <cmath>
using namespace std;

class Vector2D {
public:
    double x, y;
    Vector2D(double x=0, double y=0) : x(x), y(y) {}

    Vector2D operator+(const Vector2D& v) const { return {x+v.x, y+v.y}; }
    Vector2D operator-(const Vector2D& v) const { return {x-v.x, y-v.y}; }
    Vector2D operator*(double s)          const { return {x*s, y*s}; }
    double   operator*(const Vector2D& v) const { return x*v.x + y*v.y; } // dot product
    bool     operator==(const Vector2D& v)const { return x==v.x && y==v.y; }
    bool     operator!=(const Vector2D& v)const { return !(*this==v); }

    double magnitude() const { return sqrt(x*x + y*y); }
    Vector2D normalize() const {
        double m = magnitude();
        return {x/m, y/m};
    }

    friend ostream& operator<<(ostream& os, const Vector2D& v) {
        return os << "(" << v.x << ", " << v.y << ")";
    }
    friend Vector2D operator*(double s, const Vector2D& v) { return v * s; }
};

int main() {
    Vector2D a(3, 4), b(1, 2);
    cout << "a = " << a << endl;
    cout << "b = " << b << endl;
    cout << "a + b = " << (a + b) << endl;
    cout << "a - b = " << (a - b) << endl;
    cout << "a * 2 = " << (a * 2) << endl;
    cout << "dot product = " << (a * b) << endl;
    cout << "|a| = " << a.magnitude() << endl;
    cout << "norm(a) = " << a.normalize() << endl;
    return 0;
}
