// Beginner: Range-Based For Loop
#include <iostream>
#include <vector>
#include <string>
#include <map>
using namespace std;
int main() {
    vector<int> nums = {1, 2, 3, 4, 5};
    int sum = 0;
    for (int n : nums) sum += n;
    cout << "Sum: " << sum << endl;
    for (auto& n : nums) n *= 2;
    for (const auto& n : nums) cout << n << " ";
    cout << endl;
    string s = "Hello";
    for (char c : s) cout << c << "-";
    cout << endl;
    map<string,int> m = {{"a",1},{"b",2},{"c",3}};
    for (const auto& [key, val] : m)
        cout << key << "=" << val << " ";
    cout << endl;
    return 0;
}
