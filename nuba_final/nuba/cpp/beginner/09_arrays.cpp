// Beginner: Arrays
#include <iostream>
using namespace std;

int main() {
    // 1D array
    int arr[] = {5, 3, 8, 1, 9, 2, 7, 4, 6};
    int n = 9;

    cout << "Array: ";
    for (int i = 0; i < n; i++) cout << arr[i] << " ";
    cout << endl;

    // Find max and min
    int mx = arr[0], mn = arr[0];
    for (int i = 1; i < n; i++) {
        if (arr[i] > mx) mx = arr[i];
        if (arr[i] < mn) mn = arr[i];
    }
    cout << "Max: " << mx << ", Min: " << mn << endl;

    // Sum and average
    int sum = 0;
    for (int i = 0; i < n; i++) sum += arr[i];
    cout << "Sum: " << sum << ", Avg: " << (double)sum/n << endl;

    // 2D array
    int matrix[3][3] = {{1,2,3},{4,5,6},{7,8,9}};
    cout << "Matrix:" << endl;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) cout << matrix[i][j] << " ";
        cout << endl;
    }
    return 0;
}
