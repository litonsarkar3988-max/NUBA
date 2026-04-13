// Beginner C++: 20 Scope

#include <iostream>
using namespace std;

int global_var = 100;

void demonstrate_scope() {
    int local_var = 10;
    cout << "Global: " << global_var << endl;
    cout << "Local: " << local_var << endl;
    {
        int block_var = 50;
        cout << "Block: " << block_var << endl;
        local_var = 20;
    }
    // block_var not accessible here
    cout << "Local after block: " << local_var << endl;
}

int main() {
    demonstrate_scope();
    global_var = 200;
    cout << "Modified global: " << global_var << endl;
    return 0;
}
