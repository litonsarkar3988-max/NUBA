// Beginner: Exception Handling
#include <iostream>
#include <stdexcept>
#include <string>
using namespace std;

double safe_divide(double a, double b) {
    if (b == 0) throw runtime_error("Division by zero!");
    return a / b;
}

int parse_int(const string& s) {
    try {
        return stoi(s);
    } catch (const invalid_argument&) {
        throw invalid_argument("Not a valid integer: " + s);
    }
}

class CustomException : public exception {
    string msg;
public:
    CustomException(const string& m) : msg(m) {}
    const char* what() const noexcept override { return msg.c_str(); }
};

int main() {
    // Basic try-catch
    try {
        cout << safe_divide(10, 2) << endl;
        cout << safe_divide(10, 0) << endl;
    } catch (const runtime_error& e) {
        cout << "Caught: " << e.what() << endl;
    }

    // Multiple catch blocks
    try {
        int x = parse_int("abc");
    } catch (const invalid_argument& e) {
        cout << "Invalid arg: " << e.what() << endl;
    } catch (const exception& e) {
        cout << "General: " << e.what() << endl;
    }

    // Custom exception
    try {
        throw CustomException("Custom error occurred!");
    } catch (const CustomException& e) {
        cout << "Custom: " << e.what() << endl;
    }

    // Finally equivalent
    try {
        throw runtime_error("Test");
    } catch (...) {
        cout << "Caught all exceptions" << endl;
    }
    cout << "Program continues" << endl;
    return 0;
}
