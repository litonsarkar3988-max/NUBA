// Beginner: Initializer Lists
#include <iostream>
#include <initializer_list>
#include <vector>
using namespace std;
int sum(initializer_list<int> lst) {
    int s = 0;
    for (int x : lst) s += x;
    return s;
}
double average(initializer_list<double> lst) {
    double s = 0;
    for (double x : lst) s += x;
    return s / lst.size();
}
int main() {
    cout << sum({1,2,3,4,5}) << endl;
    cout << average({85.5, 92.0, 78.3, 95.1}) << endl;
    vector<int> v = {10, 20, 30, 40, 50};
    for (int x : v) cout << x << " ";
    cout << endl;
    return 0;
}
