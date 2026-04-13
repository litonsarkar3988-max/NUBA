// Beginner C++: 30 Static Variables

#include <iostream>
using namespace std;

int counter() {
    static int count = 0;  // initialized only once
    return ++count;
}

void show_id() {
    static int id = 1000;
    cout << "ID: " << id++ << endl;
}

class Singleton {
    static int instance_count;
public:
    Singleton() { instance_count++; }
    static int get_count() { return instance_count; }
};
int Singleton::instance_count = 0;

int main() {
    cout << counter() << endl;  // 1
    cout << counter() << endl;  // 2
    cout << counter() << endl;  // 3
    show_id();  // 1000
    show_id();  // 1001
    Singleton a, b, c;
    cout << "Instances: " << Singleton::get_count() << endl;
    return 0;
}
