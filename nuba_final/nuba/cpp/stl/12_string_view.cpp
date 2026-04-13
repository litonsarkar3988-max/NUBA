// STL: String View
#include <iostream>
#include <algorithm>
#include <vector>
#include <numeric>
#include <functional>
using namespace std;

int main() {
    cout << "=== String View ===" << endl;

    vector<int> data = {5, 2, 8, 1, 9, 3, 7, 4, 6};
    cout << "Data: ";
    for (int x : data) cout << x << " ";
    cout << endl;

    // Apply String View concepts
    sort(data.begin(), data.end());
    cout << "Sorted: ";
    for (int x : data) cout << x << " ";
    cout << endl;

    int total = accumulate(data.begin(), data.end(), 0);
    cout << "Sum: " << total << endl;
    cout << "Max: " << *max_element(data.begin(), data.end()) << endl;
    cout << "Min: " << *min_element(data.begin(), data.end()) << endl;

    return 0;
}
