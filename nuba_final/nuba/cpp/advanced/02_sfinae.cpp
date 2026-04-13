// Advanced C++: SFINAE and Type Traits
#include <iostream>
#include <type_traits>
using namespace std;

// SFINAE: enable_if
template<typename T>
typename enable_if<is_integral<T>::value, string>::type
type_name(T) { return "integral"; }

template<typename T>
typename enable_if<is_floating_point<T>::value, string>::type
type_name(T) { return "floating_point"; }

// if constexpr (C++17)
template<typename T>
void print_type(T val) {
    if constexpr (is_integral_v<T>)
        cout << val << " is integral" << endl;
    else if constexpr (is_floating_point_v<T>)
        cout << val << " is floating point" << endl;
    else
        cout << val << " is other type" << endl;
}

int main() {
    cout << type_name(42) << endl;
    cout << type_name(3.14) << endl;
    print_type(42);
    print_type(3.14f);
    print_type(string("hello"));

    cout << is_same_v<int, int> << endl;
    cout << is_base_of_v<exception, runtime_error> << endl;
    return 0;
}
