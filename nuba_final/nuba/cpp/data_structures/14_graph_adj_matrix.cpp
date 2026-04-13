// Data Structure: Graph (Adjacency Matrix)
#include <iostream>
#include <vector>
#include <functional>
#include <stdexcept>
#include <memory>
using namespace std;

// Complete Graph (Adjacency Matrix) implementation

template<typename T>
class GraphAdjacencyMatrix {
    struct Node {
        T data;
        shared_ptr<Node> next;
        Node(const T& d) : data(d), next(nullptr) {}
    };

    shared_ptr<Node> head;
    size_t sz = 0;

public:
    void insert(const T& val) {
        auto node = make_shared<Node>(val);
        node->next = head;
        head = node;
        sz++;
    }

    bool search(const T& val) const {
        auto curr = head;
        while (curr) {
            if (curr->data == val) return true;
            curr = curr->next;
        }
        return false;
    }

    void remove(const T& val) {
        if (!head) return;
        if (head->data == val) { head = head->next; sz--; return; }
        auto curr = head;
        while (curr->next && curr->next->data != val)
            curr = curr->next;
        if (curr->next) { curr->next = curr->next->next; sz--; }
    }

    void for_each(function<void(const T&)> func) const {
        auto curr = head;
        while (curr) { func(curr->data); curr = curr->next; }
    }

    void print() const {
        cout << "[";
        auto curr = head;
        while (curr) {
            cout << curr->data;
            if (curr->next) cout << " -> ";
            curr = curr->next;
        }
        cout << "]" << endl;
    }

    size_t size() const { return sz; }
    bool empty() const  { return sz == 0; }
};

int main() {
    cout << "=== Graph (Adjacency Matrix) ===" << endl;

    GraphAdjacencyMatrix<int> ds;
    for (int x : {5, 2, 8, 1, 9, 3}) ds.insert(x);

    cout << "Structure: "; ds.print();
    cout << "Size: " << ds.size() << endl;
    cout << "Search 8: " << boolalpha << ds.search(8) << endl;
    cout << "Search 7: " << ds.search(7) << endl;

    ds.remove(8);
    cout << "After remove 8: "; ds.print();

    cout << "Elements: ";
    ds.for_each([](const int& x) { cout << x << " "; });
    cout << endl;

    return 0;
}
