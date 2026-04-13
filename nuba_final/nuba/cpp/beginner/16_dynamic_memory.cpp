// Beginner: Dynamic Memory Allocation
#include <iostream>
using namespace std;

int main() {
    // Single variable
    int* p = new int(42);
    cout << "Dynamic int: " << *p << endl;
    delete p;

    // Dynamic array
    int n = 5;
    int* arr = new int[n];
    for (int i = 0; i < n; i++) arr[i] = (i + 1) * 10;

    cout << "Dynamic array: ";
    for (int i = 0; i < n; i++) cout << arr[i] << " ";
    cout << endl;
    delete[] arr;

    // Dynamic 2D array
    int rows = 3, cols = 4;
    int** matrix = new int*[rows];
    for (int i = 0; i < rows; i++) {
        matrix[i] = new int[cols];
        for (int j = 0; j < cols; j++)
            matrix[i][j] = i * cols + j + 1;
    }
    cout << "Dynamic matrix:" << endl;
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) cout << matrix[i][j] << " ";
        cout << endl;
        delete[] matrix[i];
    }
    delete[] matrix;
    return 0;
}
