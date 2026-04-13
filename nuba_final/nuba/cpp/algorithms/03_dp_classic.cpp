// Algorithm: Dynamic Programming Classics
#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
using namespace std;

// Longest Common Subsequence
int lcs(const string& a, const string& b) {
    int m = a.size(), n = b.size();
    vector<vector<int>> dp(m+1, vector<int>(n+1, 0));
    for (int i = 1; i <= m; i++)
        for (int j = 1; j <= n; j++)
            dp[i][j] = (a[i-1]==b[j-1]) ? dp[i-1][j-1]+1
                                          : max(dp[i-1][j], dp[i][j-1]);
    return dp[m][n];
}

// Edit Distance
int edit_distance(const string& a, const string& b) {
    int m = a.size(), n = b.size();
    vector<vector<int>> dp(m+1, vector<int>(n+1));
    for (int i = 0; i <= m; i++) dp[i][0] = i;
    for (int j = 0; j <= n; j++) dp[0][j] = j;
    for (int i = 1; i <= m; i++)
        for (int j = 1; j <= n; j++)
            dp[i][j] = (a[i-1]==b[j-1]) ? dp[i-1][j-1]
                       : 1 + min({dp[i-1][j], dp[i][j-1], dp[i-1][j-1]});
    return dp[m][n];
}

// 0/1 Knapsack
int knapsack(vector<int>& w, vector<int>& v, int W) {
    int n = w.size();
    vector<vector<int>> dp(n+1, vector<int>(W+1, 0));
    for (int i = 1; i <= n; i++)
        for (int j = 0; j <= W; j++) {
            dp[i][j] = dp[i-1][j];
            if (w[i-1] <= j)
                dp[i][j] = max(dp[i][j], v[i-1] + dp[i-1][j-w[i-1]]);
        }
    return dp[n][W];
}

// Coin Change
int coin_change(vector<int>& coins, int amount) {
    vector<int> dp(amount+1, amount+1);
    dp[0] = 0;
    for (int i = 1; i <= amount; i++)
        for (int c : coins)
            if (c <= i) dp[i] = min(dp[i], dp[i-c]+1);
    return dp[amount] > amount ? -1 : dp[amount];
}

int main() {
    cout << "LCS('ABCBDAB','BDCAB') = " << lcs("ABCBDAB","BDCAB") << endl;
    cout << "Edit('kitten','sitting') = " << edit_distance("kitten","sitting") << endl;
    vector<int> w={1,3,4,5}, v={1,4,5,7};
    cout << "Knapsack(cap=7) = " << knapsack(w,v,7) << endl;
    vector<int> coins={1,5,6,9};
    cout << "Coin change(11) = " << coin_change(coins,11) << endl;
    return 0;
}
