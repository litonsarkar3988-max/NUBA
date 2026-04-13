// Beginner C++: 24 Enums

#include <iostream>
#include <string>
using namespace std;

enum Color { RED, GREEN, BLUE, YELLOW, PURPLE };
enum class Direction { NORTH, SOUTH, EAST, WEST };
enum class Season { SPRING, SUMMER, AUTUMN, WINTER };

string color_name(Color c) {
    switch(c) {
        case RED:    return "Red";
        case GREEN:  return "Green";
        case BLUE:   return "Blue";
        case YELLOW: return "Yellow";
        case PURPLE: return "Purple";
        default:     return "Unknown";
    }
}

int main() {
    Color c = BLUE;
    cout << "Color: " << color_name(c) << " (value=" << c << ")" << endl;

    Direction d = Direction::NORTH;
    if (d == Direction::NORTH) cout << "Going North!" << endl;

    Season s = Season::SUMMER;
    if (s == Season::SUMMER) cout << "It's Summer!" << endl;

    for (int i = RED; i <= PURPLE; i++)
        cout << color_name(static_cast<Color>(i)) << " ";
    cout << endl;
    return 0;
}
