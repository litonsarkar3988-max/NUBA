// String Algorithm (C++): Palindrome Tree (Eertree)
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

// Palindrome Tree (Eertree) Implementation

class StringSolver {
public:
    // KMP failure function
    vector<int> build_failure(const string& pattern) {
        int m = pattern.size();
        vector<int> fail(m, 0);
        for (int i = 1; i < m; i++) {
            int j = fail[i-1];
            while (j > 0 && pattern[i] != pattern[j]) j = fail[j-1];
            if (pattern[i] == pattern[j]) j++;
            fail[i] = j;
        }
        return fail;
    }

    // KMP search
    vector<int> search(const string& text, const string& pattern) {
        auto fail = build_failure(pattern);
        vector<int> matches;
        int j = 0;
        for (int i = 0; i < (int)text.size(); i++) {
            while (j > 0 && text[i] != pattern[j]) j = fail[j-1];
            if (text[i] == pattern[j]) j++;
            if (j == (int)pattern.size()) {
                matches.push_back(i - j + 1);
                j = fail[j-1];
            }
        }
        return matches;
    }

    // Edit distance
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
};

int main() {
    cout << "=== Palindrome Tree (Eertree) ===" << endl;
    StringSolver solver;

    string text = "AABAACAADAABAABA";
    string pattern = "AABA";
    auto matches = solver.search(text, pattern);
    cout << "Pattern '" << pattern << "' found at: ";
    for (int pos : matches) cout << pos << " ";
    cout << endl;

    cout << "Edit distance('kitten','sitting') = "
         << solver.edit_distance("kitten", "sitting") << endl;

    return 0;
}
