// C++ OOP: 05 Encapsulation

#include <iostream>
#include <string>
#include <stdexcept>
using namespace std;

class Temperature {
    double celsius;
    static constexpr double ABSOLUTE_ZERO = -273.15;

    void validate(double c) {
        if (c < ABSOLUTE_ZERO)
            throw invalid_argument("Temperature below absolute zero!");
    }

public:
    Temperature(double c = 0) { validate(c); celsius = c; }

    void set_celsius(double c)    { validate(c); celsius = c; }
    void set_fahrenheit(double f) { set_celsius((f-32)*5.0/9.0); }
    void set_kelvin(double k)     { set_celsius(k - 273.15); }

    double get_celsius()    const { return celsius; }
    double get_fahrenheit() const { return celsius * 9.0/5.0 + 32; }
    double get_kelvin()     const { return celsius + 273.15; }

    void print() const {
        cout << get_celsius() << "°C = "
             << get_fahrenheit() << "°F = "
             << get_kelvin() << "K" << endl;
    }
};

int main() {
    Temperature t(100);
    t.print();
    t.set_fahrenheit(32);
    t.print();
    t.set_kelvin(373.15);
    t.print();
    try {
        t.set_celsius(-300);
    } catch (const exception& e) {
        cout << "Error: " << e.what() << endl;
    }
    return 0;
}
