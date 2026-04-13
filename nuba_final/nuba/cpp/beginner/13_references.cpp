// Beginner: References
#include <iostream>
using namespace std;

void swap_by_ref(int& a, int& b) {
    int temp = a;
    a = b;
    b = temp;
}

void increment(int& n) { n++; }

double& get_element(double arr[], int idx) {
    return arr[idx];
}

int main() {
    int a = 10, b = 20;
    cout << "Before swap: a=" << a << ", b=" << b << endl;
    swap_by_ref(a, b);
    cout << "After swap: a=" << a << ", b=" << b << endl;

    int x = 5;
    increment(x);
    cout << "After increment: x=" << x << endl;

    // Reference to array element
    double scores[] = {85.5, 92.0, 78.3};
    get_element(scores, 1) = 95.0;
    cout << "Updated score: " << scores[1] << endl;

    // Const reference
    const int& cref = a;
    cout << "Const ref: " << cref << endl;
    return 0;
}
