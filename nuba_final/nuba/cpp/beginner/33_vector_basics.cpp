// Beginner C++: vector basics

#include <iostream>
#include <vector>
using namespace std;
int main() {
    vector<int> v = {3,1,4,1,5,9,2,6};
    v.push_back(5);
    v.push_back(3);
    cout << "Size: " << v.size() << endl;
    cout << "Elements: ";
    for(int x : v) cout << x << " ";
    cout << endl;
    cout << "Front: " << v.front() << ", Back: " << v.back() << endl;
    v.pop_back();
    v.erase(v.begin());
    cout << "After erase: ";
    for(int x : v) cout << x << " ";
    cout << endl;
    return 0;
}
