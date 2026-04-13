// Beginner C++: 13 Strings Cstyle

#include <iostream>
#include <cstring>
using namespace std;

int main() {
    char str1[] = "Hello";
    char str2[] = "World";
    char result[20];

    cout << "Length of str1: " << strlen(str1) << endl;
    strcpy(result, str1);
    strcat(result, " ");
    strcat(result, str2);
    cout << "Concatenated: " << result << endl;
    cout << "Compare: " << strcmp(str1, str2) << endl;
    return 0;
}
