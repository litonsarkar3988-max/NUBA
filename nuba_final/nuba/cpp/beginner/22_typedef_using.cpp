// Beginner: Typedef and Using
#include <iostream>
#include <vector>
#include <map>
using namespace std;
typedef unsigned long long ull;
typedef vector<int> vi;
typedef map<string, int> smap;
using Matrix = vector<vector<int>>;
int main() {
    ull big_num = 1234567890123456789ULL;
    cout << "Big number: " << big_num << endl;
    vi nums = {1, 2, 3, 4, 5};
    for (int x : nums) cout << x << " ";
    cout << endl;
    smap scores = {{"Alice", 95}, {"Bob", 82}};
    for (auto& p : scores) cout << p.first << ": " << p.second << endl;
    return 0;
}
