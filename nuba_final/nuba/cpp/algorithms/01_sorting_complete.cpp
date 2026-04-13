// Algorithm: All Sorting Algorithms
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

void print(const vector<int>& v, const string& label) {
    cout << label << ": ";
    for (int x : v) cout << x << " ";
    cout << endl;
}

void bubble_sort(vector<int>& v) {
    int n = v.size();
    for (int i = 0; i < n-1; i++)
        for (int j = 0; j < n-i-1; j++)
            if (v[j] > v[j+1]) swap(v[j], v[j+1]);
}

void merge_sort(vector<int>& v, int l, int r) {
    if (l >= r) return;
    int m = l + (r-l)/2;
    merge_sort(v, l, m);
    merge_sort(v, m+1, r);
    vector<int> tmp;
    int i = l, j = m+1;
    while (i <= m && j <= r) {
        if (v[i] <= v[j]) tmp.push_back(v[i++]);
        else tmp.push_back(v[j++]);
    }
    while (i <= m) tmp.push_back(v[i++]);
    while (j <= r) tmp.push_back(v[j++]);
    for (int k = l; k <= r; k++) v[k] = tmp[k-l];
}

int partition(vector<int>& v, int lo, int hi) {
    int pivot = v[hi], i = lo-1;
    for (int j = lo; j < hi; j++)
        if (v[j] <= pivot) swap(v[++i], v[j]);
    swap(v[++i], v[hi]);
    return i;
}

void quick_sort(vector<int>& v, int lo, int hi) {
    if (lo >= hi) return;
    int p = partition(v, lo, hi);
    quick_sort(v, lo, p-1);
    quick_sort(v, p+1, hi);
}

int main() {
    vector<int> original = {64,34,25,12,22,11,90,45,67};
    vector<int> v1 = original, v2 = original, v3 = original, v4 = original;
    bubble_sort(v1);      print(v1, "Bubble");
    merge_sort(v2,0,v2.size()-1); print(v2, "Merge");
    quick_sort(v3,0,v3.size()-1); print(v3, "Quick");
    sort(v4.begin(),v4.end());    print(v4, "STL");
    return 0;
}
