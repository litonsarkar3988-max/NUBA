// STL: Vector Container
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int main() {
    vector<int> v = {5, 2, 8, 1, 9, 3};
    v.push_back(7);
    cout << "Size: " << v.size() << endl;
    sort(v.begin(), v.end());
    cout << "Sorted: ";
    for (int x : v) cout << x << " ";
    cout << endl;
    auto it = find(v.begin(), v.end(), 8);
    cout << "Found 8 at index: " << distance(v.begin(), it) << endl;
    v.erase(remove(v.begin(), v.end(), 3), v.end());
    cout << "After erase 3: ";
    for (int x : v) cout << x << " ";
    cout << endl;
    return 0;
}
