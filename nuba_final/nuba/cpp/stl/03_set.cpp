// STL: Set and Multiset
#include <iostream>
#include <set>
#include <vector>
using namespace std;
int main() {
    set<int> s = {5, 2, 8, 1, 9, 3, 5, 2}; // auto unique+sorted
    cout << "Set: ";
    for (int x : s) cout << x << " ";
    cout << endl;
    s.insert(7);
    s.erase(3);
    cout << "After insert 7, erase 3: ";
    for (int x : s) cout << x << " ";
    cout << endl;
    cout << "Contains 8: " << (s.count(8) > 0) << endl;
    // Set operations
    set<int> a = {1,2,3,4,5}, b = {3,4,5,6,7};
    vector<int> inter, uni, diff;
    set_intersection(a.begin(),a.end(),b.begin(),b.end(),back_inserter(inter));
    set_union(a.begin(),a.end(),b.begin(),b.end(),back_inserter(uni));
    cout << "Intersection: "; for (int x:inter) cout<<x<<" "; cout<<endl;
    cout << "Union: "; for (int x:uni) cout<<x<<" "; cout<<endl;
    return 0;
}
