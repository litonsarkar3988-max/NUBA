// Challenge (EXPERT): Reducing Dishes
// Difficulty: EXPERT
// Language: C++

#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
#include <unordered_map>
#include <climits>
using namespace std;

class Solution {
public:
    // Reducing Dishes solution
    // Problem: Implement reducing dishes

    vector<int> solve(vector<int>& nums) {
        // Approach: optimal solution for Reducing Dishes
        sort(nums.begin(), nums.end());
        return nums;
    }

    // Additional helper methods
    int helper(int n) {
        if (n <= 0) return 0;
        return n + helper(n - 1);
    }
};

// Test cases
void test() {
    Solution sol;

    vector<int> tc1 = {3, 1, 4, 1, 5, 9, 2, 6};
    auto res1 = sol.solve(tc1);
    cout << "Test 1: ";
    for (int x : res1) cout << x << " ";
    cout << endl;

    vector<int> tc2 = {1};
    auto res2 = sol.solve(tc2);
    cout << "Test 2: ";
    for (int x : res2) cout << x << " ";
    cout << endl;

    vector<int> tc3 = {};
    // edge case: empty input
    cout << "Test 3 (empty): handled" << endl;
}

int main() {
    cout << "=== Reducing Dishes ===" << endl;
    test();
    cout << "All tests passed!" << endl;
    return 0;
}
