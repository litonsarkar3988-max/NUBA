// Beginner: Strings
#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

int main() {
    string s = "Hello, Nuba World!";
    cout << "String: " << s << endl;
    cout << "Length: " << s.length() << endl;
    cout << "Uppercase: ";
    string up = s;
    transform(up.begin(), up.end(), up.begin(), ::toupper);
    cout << up << endl;
    cout << "Substr[7,4]: " << s.substr(7, 4) << endl;
    cout << "Find 'Nuba': " << s.find("Nuba") << endl;
    cout << "Replace: ";
    string r = s;
    r.replace(r.find("Nuba"), 4, "C++");
    cout << r << endl;

    // String reversal
    string rev = s;
    reverse(rev.begin(), rev.end());
    cout << "Reversed: " << rev << endl;
    return 0;
}
