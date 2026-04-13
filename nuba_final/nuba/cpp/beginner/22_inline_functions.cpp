// Beginner C++: 22 Inline Functions

#include <iostream>
using namespace std;

inline int max2(int a, int b) { return a > b ? a : b; }
inline int min2(int a, int b) { return a < b ? a : b; }
inline int abs2(int x) { return x < 0 ? -x : x; }
inline bool is_even(int n) { return n % 2 == 0; }
inline bool is_prime_simple(int n) {
    if (n < 2) return false;
    for (int i = 2; i*i <= n; i++)
        if (n % i == 0) return false;
    return true;
}

int main() {
    cout << "max(3,7) = " << max2(3,7) << endl;
    cout << "min(3,7) = " << min2(3,7) << endl;
    cout << "abs(-5) = " << abs2(-5) << endl;
    cout << "is_even(4) = " << is_even(4) << endl;
    cout << "is_prime(17) = " << is_prime_simple(17) << endl;

    cout << "Primes up to 30: ";
    for (int i = 2; i <= 30; i++)
        if (is_prime_simple(i)) cout << i << " ";
    cout << endl;
    return 0;
}
