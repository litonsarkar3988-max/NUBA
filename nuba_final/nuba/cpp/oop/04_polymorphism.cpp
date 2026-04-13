// C++ OOP: 04 Polymorphism

#include <iostream>
#include <vector>
#include <memory>
#include <string>
using namespace std;

class Animal {
protected:
    string name;
    int    age;
public:
    Animal(string n, int a) : name(n), age(a) {}
    virtual string speak()  const = 0;
    virtual string type()   const = 0;
    virtual void   describe() const {
        cout << type() << " '" << name << "' (age " << age
             << ") says: " << speak() << endl;
    }
    virtual ~Animal() {}
    string get_name() const { return name; }
};

class Dog : public Animal {
    string breed;
public:
    Dog(string n, int a, string b) : Animal(n,a), breed(b) {}
    string speak() const override { return "Woof!"; }
    string type()  const override { return "Dog"; }
    void   describe() const override {
        Animal::describe();
        cout << "  Breed: " << breed << endl;
    }
};

class Cat : public Animal {
    bool indoor;
public:
    Cat(string n, int a, bool i) : Animal(n,a), indoor(i) {}
    string speak()   const override { return "Meow!"; }
    string type()    const override { return "Cat"; }
};

class Bird : public Animal {
    bool can_fly;
public:
    Bird(string n, int a, bool f) : Animal(n,a), can_fly(f) {}
    string speak()   const override { return "Tweet!"; }
    string type()    const override { return "Bird"; }
};

int main() {
    vector<unique_ptr<Animal>> animals;
    animals.push_back(make_unique<Dog>("Rex", 3, "Labrador"));
    animals.push_back(make_unique<Cat>("Whiskers", 5, true));
    animals.push_back(make_unique<Bird>("Tweety", 2, true));
    animals.push_back(make_unique<Dog>("Max", 4, "German Shepherd"));

    for (const auto& a : animals) a->describe();
    return 0;
}
