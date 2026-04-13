// STL: Map and Multimap
#include <iostream>
#include <map>
#include <string>
using namespace std;
int main() {
    map<string, int> freq;
    string words[] = {"apple","banana","apple","cherry","banana","apple"};
    for (const auto& w : words) freq[w]++;
    cout << "Word frequencies:" << endl;
    for (const auto& [word, cnt] : freq)
        cout << "  " << word << ": " << cnt << endl;
    cout << "apple count: " << freq["apple"] << endl;
    freq.erase("banana");
    cout << "After erase, size: " << freq.size() << endl;
    // lower/upper bound
    auto lb = freq.lower_bound("cherry");
    cout << "lower_bound('cherry'): " << lb->first << endl;
    return 0;
}
