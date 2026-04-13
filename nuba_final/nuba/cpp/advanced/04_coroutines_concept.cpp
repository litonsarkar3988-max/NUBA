// Advanced C++: Coroutines (C++20 Concept)
// C++20 Coroutines concept illustration
// (Full coroutine requires compiler support)
#include <iostream>
#include <generator>  // C++23 or custom
#include <vector>
using namespace std;

// Simulating generator behavior without coroutines
class Range {
    int current, end_val, step;
public:
    Range(int start, int end, int step = 1)
        : current(start), end_val(end), step(step) {}

    class iterator {
        int val, step;
    public:
        iterator(int v, int s) : val(v), step(s) {}
        iterator& operator++() { val += step; return *this; }
        int operator*() const { return val; }
        bool operator!=(const iterator& o) const { return val < o.val; }
    };
    iterator begin() { return {current, step}; }
    iterator end()   { return {end_val, step}; }
};

// Fibonacci generator simulation
class FibGen {
    long long a = 0, b = 1;
    int count, max_count;
public:
    FibGen(int n) : count(0), max_count(n) {}
    bool has_next() const { return count < max_count; }
    long long next() {
        long long val = a;
        long long c = a + b; a = b; b = c;
        count++;
        return val;
    }
};

int main() {
    cout << "Range 0..10 step 2: ";
    for (int x : Range(0, 10, 2)) cout << x << " ";
    cout << endl;

    cout << "Fibonacci: ";
    FibGen fib(10);
    while (fib.has_next()) cout << fib.next() << " ";
    cout << endl;
    return 0;
}
