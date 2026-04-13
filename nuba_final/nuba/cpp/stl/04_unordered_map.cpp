// STL: Unordered Map (Hash Map)
#include <iostream>
#include <unordered_map>
#include <string>
#include <vector>
using namespace std;
int main() {
    unordered_map<string, int> scores;
    scores["Alice"] = 95;
    scores["Bob"] = 82;
    scores["Carol"] = 91;
    scores.insert({"Dave", 78});
    cout << "Scores:" << endl;
    for (const auto& [name, score] : scores)
        cout << "  " << name << ": " << score << endl;
    // Two-sum using hash map
    vector<int> nums = {2, 7, 11, 15};
    int target = 9;
    unordered_map<int, int> seen;
    for (int i = 0; i < (int)nums.size(); i++) {
        int comp = target - nums[i];
        if (seen.count(comp))
            cout << "Two sum: [" << seen[comp] << "," << i << "]" << endl;
        seen[nums[i]] = i;
    }
    return 0;
}
