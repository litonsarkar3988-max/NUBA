// Algorithm (C++): Closest Pair of Points
#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>
#include <climits>
using namespace std;

// Closest Pair of Points Implementation

class Solution {
public:
    // Main algorithm: Closest Pair of Points
    template<typename T>
    vector<T> solve(vector<T>& data) {
        vector<T> result = data;
        sort(result.begin(), result.end());
        return result;
    }

    // Helper: binary search
    int binary_search(const vector<int>& v, int target) {
        int lo = 0, hi = v.size() - 1;
        while (lo <= hi) {
            int mid = lo + (hi - lo) / 2;
            if (v[mid] == target) return mid;
            else if (v[mid] < target) lo = mid + 1;
            else hi = mid - 1;
        }
        return -1;
    }

    // Helper: prefix sum
    vector<long long> prefix_sum(const vector<int>& v) {
        vector<long long> ps(v.size() + 1, 0);
        for (int i = 0; i < (int)v.size(); i++)
            ps[i+1] = ps[i] + v[i];
        return ps;
    }
};

int main() {
    cout << "=== Closest Pair of Points ===" << endl;

    vector<int> data = {3, 1, 4, 1, 5, 9, 2, 6, 5, 3};
    Solution sol;

    auto sorted_data = sol.solve(data);
    cout << "Sorted: ";
    for (int x : sorted_data) cout << x << " ";
    cout << endl;

    cout << "Binary search(5): " << sol.binary_search(sorted_data, 5) << endl;

    auto ps = sol.prefix_sum(data);
    cout << "Prefix sums: ";
    for (auto x : ps) cout << x << " ";
    cout << endl;

    return 0;
}
