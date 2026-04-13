// OOP: Class Templates
#include <iostream>
#include <stdexcept>
using namespace std;

template<typename T>
class Stack {
    T* data;
    int top_idx;
    int capacity;
public:
    Stack(int cap = 10) : capacity(cap), top_idx(-1) {
        data = new T[cap];
    }
    ~Stack() { delete[] data; }

    void push(const T& val) {
        if (top_idx >= capacity - 1) throw overflow_error("Stack full");
        data[++top_idx] = val;
    }
    T pop() {
        if (top_idx < 0) throw underflow_error("Stack empty");
        return data[top_idx--];
    }
    T& top() {
        if (top_idx < 0) throw underflow_error("Stack empty");
        return data[top_idx];
    }
    bool empty() const { return top_idx < 0; }
    int  size()  const { return top_idx + 1; }
};

template<typename K, typename V>
class Pair {
public:
    K key; V value;
    Pair(K k, V v) : key(k), value(v) {}
    void print() const {
        cout << "(" << key << ", " << value << ")" << endl;
    }
};

int main() {
    Stack<int> si;
    for (int i : {1, 2, 3, 4, 5}) si.push(i);
    cout << "Int stack (pop): ";
    while (!si.empty()) cout << si.pop() << " ";
    cout << endl;

    Stack<string> ss;
    ss.push("hello"); ss.push("world"); ss.push("nuba");
    cout << "String stack top: " << ss.top() << endl;

    Pair<string, int> p("age", 25);
    p.print();
    return 0;
}
