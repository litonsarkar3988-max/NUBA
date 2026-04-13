// Beginner: Pointers
#include <iostream>
using namespace std;

int main() {
    int x = 42;
    int* ptr = &x;

    cout << "Value of x: " << x << endl;
    cout << "Address of x: " << &x << endl;
    cout << "Value of ptr (address): " << ptr << endl;
    cout << "Value pointed to by ptr: " << *ptr << endl;

    // Modify via pointer
    *ptr = 100;
    cout << "After *ptr = 100, x = " << x << endl;

    // Pointer arithmetic
    int arr[] = {10, 20, 30, 40, 50};
    int* p = arr;
    for (int i = 0; i < 5; i++) {
        cout << "arr[" << i << "] = " << *(p + i) << endl;
    }

    // Null pointer
    int* null_ptr = nullptr;
    if (null_ptr == nullptr) cout << "Null pointer detected" << endl;
    return 0;
}
