// Beginner: Searching Algorithms
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int linear_search(const vector<int>& v, int target) {
    for (int i = 0; i < (int)v.size(); i++)
        if (v[i] == target) return i;
    return -1;
}

int binary_search_custom(const vector<int>& v, int target) {
    int lo = 0, hi = v.size() - 1;
    while (lo <= hi) {
        int mid = lo + (hi - lo) / 2;
        if (v[mid] == target) return mid;
        else if (v[mid] < target) lo = mid + 1;
        else hi = mid - 1;
    }
    return -1;
}

int main() {
    vector<int> v = {2, 5, 8, 12, 16, 23, 38, 56, 72, 91};

    cout << "Linear search for 23: index " << linear_search(v, 23) << endl;
    cout << "Linear search for 99: index " << linear_search(v, 99) << endl;
    cout << "Binary search for 56: index " << binary_search_custom(v, 56) << endl;
    cout << "Binary search for 10: index " << binary_search_custom(v, 10) << endl;

    // STL binary search
    cout << "STL binary_search(23): " << boolalpha << binary_search(v.begin(), v.end(), 23) << endl;
    auto it = lower_bound(v.begin(), v.end(), 38);
    cout << "lower_bound(38): index " << (it - v.begin()) << endl;
    return 0;
}
