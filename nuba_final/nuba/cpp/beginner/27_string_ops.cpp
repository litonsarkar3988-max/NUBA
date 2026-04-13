// Beginner: String Operations
#include <iostream>
#include <string>
#include <sstream>
#include <algorithm>
using namespace std;
int main() {
    string s = "  Hello, C++ World!  ";
    // Trim
    auto start = s.find_first_not_of(" ");
    auto end = s.find_last_not_of(" ");
    string trimmed = s.substr(start, end - start + 1);
    cout << "Trimmed: [" << trimmed << "]" << endl;
    // Split by delimiter
    string csv = "apple,banana,cherry,date";
    stringstream ss(csv);
    string token;
    cout << "Tokens: ";
    while (getline(ss, token, ',')) cout << token << " ";
    cout << endl;
    // Count occurrences
    string text = "hello world hello nuba hello";
    string word = "hello";
    int cnt = 0;
    size_t pos = 0;
    while ((pos = text.find(word, pos)) != string::npos) { cnt++; pos++; }
    cout << "'" << word << "' appears " << cnt << " times" << endl;
    return 0;
}
