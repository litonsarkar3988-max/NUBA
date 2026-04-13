// Beginner C++: String ops

#include <iostream>
#include <string>
#include <sstream>
using namespace std;
int main() {
    string s = "Hello World Nuba";
    cout << "Upper: "; for(char& c:s) c=toupper(c); cout<<s<<endl;
    cout << "Lower: "; for(char& c:s) c=tolower(c); cout<<s<<endl;
    stringstream ss(s);
    string word;
    cout << "Words: ";
    while(ss >> word) cout << "[" << word << "] ";
    cout << endl;
    return 0;
}
