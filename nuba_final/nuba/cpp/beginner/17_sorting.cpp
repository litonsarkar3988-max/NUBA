// Beginner: Sorting Algorithms
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

void print_vec(const vector<int>& v) {
    for (int x : v) cout << x << " ";
    cout << endl;
}

void bubble_sort(vector<int>& v) {
    int n = v.size();
    for (int i = 0; i < n-1; i++)
        for (int j = 0; j < n-i-1; j++)
            if (v[j] > v[j+1]) swap(v[j], v[j+1]);
}

void selection_sort(vector<int>& v) {
    int n = v.size();
    for (int i = 0; i < n-1; i++) {
        int min_idx = i;
        for (int j = i+1; j < n; j++)
            if (v[j] < v[min_idx]) min_idx = j;
        swap(v[i], v[min_idx]);
    }
}

int main() {
    vector<int> v1 = {64, 34, 25, 12, 22, 11, 90};
    vector<int> v2 = v1;

    cout << "Original: "; print_vec(v1);
    bubble_sort(v1);
    cout << "Bubble: "; print_vec(v1);

    selection_sort(v2);
    cout << "Selection: "; print_vec(v2);

    vector<int> v3 = {5, 2, 8, 1, 9};
    sort(v3.begin(), v3.end());
    cout << "STL sort: "; print_vec(v3);
    return 0;
}
