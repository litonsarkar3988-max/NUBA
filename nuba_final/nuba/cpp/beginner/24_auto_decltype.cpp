// Beginner: Auto and Decltype
#include <iostream>
#include <vector>
#include <map>
using namespace std;
int main() {
    auto x = 42;
    auto d = 3.14;
    auto s = string("Hello");
    cout << x << " " << d << " " << s << endl;
    vector<int> v = {1, 2, 3, 4, 5};
    for (auto it = v.begin(); it != v.end(); ++it)
        cout << *it << " ";
    cout << endl;
    for (const auto& val : v) cout << val << " ";
    cout << endl;
    auto add = [](int a, int b) { return a + b; };
    cout << "add(3,4) = " << add(3,4) << endl;
    decltype(x) y = 100;
    cout << "decltype: " << y << endl;
    return 0;
}
