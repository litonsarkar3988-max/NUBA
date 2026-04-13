// Advanced C++: Source Location
#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>
using namespace std;

// Source Location
// This demonstrates advanced C++ features

template<typename T, typename F>
vector<T> transform_vec(const vector<T>& v, F func) {
    vector<T> result(v.size());
    transform(v.begin(), v.end(), result.begin(), func);
    return result;
}

template<typename T>
T sum_vec(const vector<T>& v) {
    return accumulate(v.begin(), v.end(), T{});
}

template<typename T>
void print_vec(const vector<T>& v, const string& label = "") {
    if (!label.empty()) cout << label << ": ";
    for (const auto& x : v) cout << x << " ";
    cout << endl;
}

int main() {
    cout << "=== Source Location ===" << endl;

    vector<int> data = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    print_vec(data, "Original");

    auto doubled = transform_vec(data, [](int x) { return x * 2; });
    print_vec(doubled, "Doubled");

    auto squares = transform_vec(data, [](int x) { return x * x; });
    print_vec(squares, "Squares");

    cout << "Sum: " << sum_vec(data) << endl;
    cout << "Max: " << *max_element(data.begin(), data.end()) << endl;

    return 0;
}
