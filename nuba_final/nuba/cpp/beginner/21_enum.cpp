// Beginner: Enumerations
#include <iostream>
using namespace std;
enum Color { RED, GREEN, BLUE, YELLOW };
enum class Direction { NORTH, SOUTH, EAST, WEST };
int main() {
    Color c = GREEN;
    cout << "Color value: " << c << endl;
    if (c == GREEN) cout << "It's green!" << endl;
    Direction d = Direction::NORTH;
    switch (d) {
        case Direction::NORTH: cout << "Going North" << endl; break;
        case Direction::SOUTH: cout << "Going South" << endl; break;
        default: cout << "Other direction" << endl;
    }
    return 0;
}
