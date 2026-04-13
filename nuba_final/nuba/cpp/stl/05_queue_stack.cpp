// STL: Queue and Stack
#include <iostream>
#include <queue>
#include <stack>
#include <string>
using namespace std;
int main() {
    // Stack
    stack<int> st;
    for (int x : {1,2,3,4,5}) st.push(x);
    cout << "Stack (LIFO): ";
    while (!st.empty()) { cout << st.top() << " "; st.pop(); }
    cout << endl;
    // Queue
    queue<string> q;
    q.push("first"); q.push("second"); q.push("third");
    cout << "Queue (FIFO): ";
    while (!q.empty()) { cout << q.front() << " "; q.pop(); }
    cout << endl;
    // Priority queue (max-heap)
    priority_queue<int> pq;
    for (int x : {3,1,4,1,5,9,2,6}) pq.push(x);
    cout << "Priority queue: ";
    while (!pq.empty()) { cout << pq.top() << " "; pq.pop(); }
    cout << endl;
    return 0;
}
