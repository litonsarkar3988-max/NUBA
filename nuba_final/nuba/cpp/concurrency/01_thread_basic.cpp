// Concurrency: Thread Basics
#include <iostream>
#include <thread>
#include <vector>
using namespace std;

void worker(int id, int n) {
    for (int i = 0; i < n; i++) {
        cout << "Thread " << id << ": step " << i << endl;
        this_thread::sleep_for(chrono::milliseconds(10));
    }
}

int main() {
    vector<thread> threads;
    for (int i = 0; i < 3; i++)
        threads.emplace_back(worker, i, 3);
    for (auto& t : threads) t.join();
    cout << "All threads done" << endl;
    return 0;
}
