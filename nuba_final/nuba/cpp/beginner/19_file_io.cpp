// Beginner: File I/O
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main() {
    // Write to file
    ofstream outfile("test_output.txt");
    if (outfile.is_open()) {
        outfile << "Line 1: Hello from C++!" << endl;
        outfile << "Line 2: File I/O is easy" << endl;
        outfile << "Line 3: Nuba + C++ = Great!" << endl;
        outfile.close();
        cout << "File written successfully" << endl;
    }

    // Read from file
    ifstream infile("test_output.txt");
    if (infile.is_open()) {
        string line;
        int linenum = 1;
        cout << "\nFile contents:" << endl;
        while (getline(infile, line)) {
            cout << linenum++ << ": " << line << endl;
        }
        infile.close();
    }

    // Append to file
    ofstream appendfile("test_output.txt", ios::app);
    appendfile << "Line 4: Appended line" << endl;
    appendfile.close();
    cout << "\nLine appended" << endl;
    return 0;
}
