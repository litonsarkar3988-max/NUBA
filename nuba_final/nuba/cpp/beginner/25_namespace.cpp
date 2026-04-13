// Beginner C++: 25 Namespace

#include <iostream>
#include <string>
using namespace std;

namespace Math {
    const double PI = 3.14159;
    double circle_area(double r) { return PI * r * r; }
    double circle_perimeter(double r) { return 2 * PI * r; }
}

namespace StringUtils {
    string reverse(string s) {
        return string(s.rbegin(), s.rend());
    }
    int count_vowels(const string& s) {
        int count = 0;
        for (char c : s)
            if (string("aeiouAEIOU").find(c) != string::npos) count++;
        return count;
    }
}

int main() {
    cout << "Area: " << Math::circle_area(5) << endl;
    cout << "Perimeter: " << Math::circle_perimeter(5) << endl;
    cout << "Reversed: " << StringUtils::reverse("Hello Nuba") << endl;
    cout << "Vowels: " << StringUtils::count_vowels("Hello World") << endl;
    return 0;
}
