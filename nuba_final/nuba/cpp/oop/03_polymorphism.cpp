// OOP: Polymorphism and Virtual Functions
#include <iostream>
#include <string>
#include <vector>
#include <memory>
using namespace std;

class Animal {
protected:
    string name;
public:
    Animal(const string& n) : name(n) {}
    virtual string sound() const = 0;
    virtual void speak() const {
        cout << name << " says: " << sound() << endl;
    }
    virtual string type() const { return "Animal"; }
    virtual ~Animal() {}
};

class Dog : public Animal {
public:
    Dog(const string& n) : Animal(n) {}
    string sound() const override { return "Woof!"; }
    string type() const override  { return "Dog"; }
    void fetch() const { cout << name << " fetches the ball!" << endl; }
};

class Cat : public Animal {
public:
    Cat(const string& n) : Animal(n) {}
    string sound() const override { return "Meow!"; }
    string type() const override  { return "Cat"; }
    void purr() const { cout << name << " purrs..." << endl; }
};

class Duck : public Animal {
public:
    Duck(const string& n) : Animal(n) {}
    string sound() const override { return "Quack!"; }
    string type() const override  { return "Duck"; }
};

int main() {
    vector<unique_ptr<Animal>> animals;
    animals.push_back(make_unique<Dog>("Rex"));
    animals.push_back(make_unique<Cat>("Whiskers"));
    animals.push_back(make_unique<Duck>("Donald"));
    animals.push_back(make_unique<Dog>("Buddy"));
    animals.push_back(make_unique<Cat>("Luna"));

    for (const auto& a : animals) a->speak();

    // Dynamic cast
    for (const auto& a : animals) {
        if (Dog* d = dynamic_cast<Dog*>(a.get())) d->fetch();
        if (Cat* c = dynamic_cast<Cat*>(a.get())) c->purr();
    }
    return 0;
}
