// Beginner C++: 29 Goto Label

#include <iostream>
using namespace std;

int main() {
    // goto is generally discouraged, but demonstrates labels
    int i = 0;
    loop_start:
    if (i < 5) {
        cout << "i = " << i << endl;
        i++;
        goto loop_start;
    }

    // Error handling pattern with goto
    bool success = true;
    if (!success) goto cleanup;
    cout << "Operation succeeded" << endl;

    cleanup:
    cout << "Cleanup done" << endl;
    return 0;
}
