// Beginner: Bitwise Operations
#include <iostream>
#include <bitset>
using namespace std;
int main() {
    int a = 0b1010, b = 0b1100;
    cout << "a = " << bitset<4>(a) << " (" << a << ")" << endl;
    cout << "b = " << bitset<4>(b) << " (" << b << ")" << endl;
    cout << "a & b = " << bitset<4>(a & b) << " (" << (a&b) << ")" << endl;
    cout << "a | b = " << bitset<4>(a | b) << " (" << (a|b) << ")" << endl;
    cout << "a ^ b = " << bitset<4>(a ^ b) << " (" << (a^b) << ")" << endl;
    cout << "~a = " << (int)(~a & 0xF) << endl;
    cout << "a << 1 = " << bitset<8>(a << 1) << endl;
    cout << "b >> 1 = " << bitset<4>(b >> 1) << endl;
    // Bit tricks
    int n = 42;
    cout << "Is " << n << " even: " << !(n & 1) << endl;
    cout << "Bits set in " << n << ": " << __builtin_popcount(n) << endl;
    return 0;
}
