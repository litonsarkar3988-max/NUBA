// Advanced C++: C++20 Concepts
#include <iostream>
#include <concepts>
using namespace std;

// Define concepts
template<typename T>
concept Numeric = is_arithmetic_v<T>;

template<typename T>
concept Printable = requires(T t) {
    { cout << t } -> same_as<ostream&>;
};

template<typename T>
concept Container = requires(T t) {
    t.begin();
    t.end();
    t.size();
};

// Use concepts
template<Numeric T>
T add(T a, T b) { return a + b; }

template<Printable T>
void print_val(const T& val) { cout << val << endl; }

template<Container C>
auto sum_container(const C& c) {
    typename C::value_type total{};
    for (const auto& x : c) total += x;
    return total;
}

int main() {
    cout << add(3, 4) << endl;
    cout << add(3.14, 2.71) << endl;
    print_val(42);
    print_val(string("hello"));
    vector<int> v = {1,2,3,4,5};
    cout << "Sum: " << sum_container(v) << endl;
    return 0;
}
