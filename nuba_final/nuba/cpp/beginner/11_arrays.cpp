// Beginner C++: 11 Arrays

#include <iostream>
using namespace std;

int main() {
    int arr[] = {5, 2, 8, 1, 9, 3, 7, 4, 6};
    int n = 9;

    cout << "Array: ";
    for (int i = 0; i < n; i++) cout << arr[i] << " ";
    cout << endl;

    int sum = 0, maxv = arr[0], minv = arr[0];
    for (int i = 0; i < n; i++) {
        sum += arr[i];
        if (arr[i] > maxv) maxv = arr[i];
        if (arr[i] < minv) minv = arr[i];
    }
    cout << "Sum: " << sum << ", Max: " << maxv << ", Min: " << minv << endl;
    cout << "Average: " << (double)sum / n << endl;
    return 0;
}
