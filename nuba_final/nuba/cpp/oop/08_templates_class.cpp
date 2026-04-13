// C++ OOP: 08 Templates Class

#include <iostream>
#include <string>
#include <stdexcept>
using namespace std;

template<typename T>
class Stack {
    T*   data;
    int  top;
    int  capacity;
public:
    Stack(int cap = 10) : capacity(cap), top(-1) {
        data = new T[capacity];
    }
    ~Stack() { delete[] data; }

    void push(T val) {
        if (top >= capacity-1) throw overflow_error("Stack overflow");
        data[++top] = val;
    }
    T pop() {
        if (top < 0) throw underflow_error("Stack underflow");
        return data[top--];
    }
    T    peek()     const { return data[top]; }
    bool empty()    const { return top == -1; }
    int  size()     const { return top + 1; }
    void print()    const {
        cout << "Stack [";
        for (int i = 0; i <= top; i++) cout << data[i] << (i<top?",":"");
        cout << "]" << endl;
    }
};

int main() {
    Stack<int> si;
    for (int i = 1; i <= 5; i++) si.push(i*10);
    si.print();
    cout << "Pop: " << si.pop() << endl;
    cout << "Peek: " << si.peek() << endl;

    Stack<string> ss;
    ss.push("hello"); ss.push("world"); ss.push("nuba");
    ss.print();
    return 0;
}
