// Beginner C++: 12 2D Arrays

#include <iostream>
using namespace std;

int main() {
    int matrix[3][3] = {{1,2,3},{4,5,6},{7,8,9}};

    cout << "Matrix:" << endl;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++)
            cout << matrix[i][j] << " ";
        cout << endl;
    }

    // Transpose
    cout << "Transpose:" << endl;
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++)
            cout << matrix[j][i] << " ";
        cout << endl;
    }
    return 0;
}
