// Beginner C++: 15 Pointers Basic

#include <iostream>
using namespace std;

int main() {
    int x = 42;
    int* ptr = &x;

    cout << "Value of x: " << x << endl;
    cout << "Address of x: " << &x << endl;
    cout << "Pointer ptr: " << ptr << endl;
    cout << "Value at ptr: " << *ptr << endl;

    *ptr = 100;
    cout << "After *ptr=100, x = " << x << endl;

    int arr[] = {10, 20, 30, 40, 50};
    int* p = arr;
    for (int i = 0; i < 5; i++)
        cout << *(p + i) << " ";
    cout << endl;
    return 0;
}
