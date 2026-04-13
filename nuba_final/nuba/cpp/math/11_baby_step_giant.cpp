// Math (C++): Baby-Step Giant-Step
#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <numeric>
using namespace std;
typedef long long ll;
const ll MOD = 1e9 + 7;

ll power(ll base, ll exp, ll mod) {
    ll result = 1;
    base %= mod;
    while (exp > 0) {
        if (exp & 1) result = result * base % mod;
        base = base * base % mod;
        exp >>= 1;
    }
    return result;
}

ll gcd(ll a, ll b) { return b == 0 ? a : gcd(b, a % b); }
ll lcm(ll a, ll b) { return a / gcd(a, b) * b; }

// Baby-Step Giant-Step
void solve() {
    cout << "=== Baby-Step Giant-Step ===" << endl;

    vector<int> nums = {12, 18, 24, 36, 48};
    ll g = nums[0];
    for (int x : nums) g = gcd(g, x);
    cout << "GCD of all: " << g << endl;

    cout << "2^10 mod MOD = " << power(2, 10, MOD) << endl;
    cout << "LCM(12,18) = " << lcm(12, 18) << endl;
}

int main() {
    solve();
    return 0;
}
