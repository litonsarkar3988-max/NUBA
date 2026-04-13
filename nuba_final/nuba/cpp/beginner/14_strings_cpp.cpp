// Beginner C++: 14 Strings Cpp

#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

int main() {
    string s = "Hello, World!";
    cout << "String: " << s << endl;
    cout << "Length: " << s.length() << endl;
    cout << "Uppercase: ";
    string upper = s;
    transform(upper.begin(), upper.end(), upper.begin(), ::toupper);
    cout << upper << endl;
    cout << "Substr: " << s.substr(7, 5) << endl;
    cout << "Find 'World': " << s.find("World") << endl;
    s.replace(7, 5, "Nuba");
    cout << "Replaced: " << s << endl;
    return 0;
}
