// Concurrency: Mutex and Locks
#include <iostream>
#include <thread>
#include <mutex>
#include <vector>
using namespace std;

mutex mtx;
long long shared_counter = 0;

void increment(int n) {
    for (int i = 0; i < n; i++) {
        lock_guard<mutex> lock(mtx);
        shared_counter++;
    }
}

int main() {
    vector<thread> threads;
    for (int i = 0; i < 4; i++)
        threads.emplace_back(increment, 10000);
    for (auto& t : threads) t.join();
    cout << "Counter: " << shared_counter << " (expected: 40000)" << endl;
    return 0;
}
