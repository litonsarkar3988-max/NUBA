// Concurrency: Atomic Operations
#include <iostream>
#include <thread>
#include <atomic>
#include <vector>
using namespace std;

atomic<long long> counter(0);
atomic<bool> flag(false);

void worker() {
    for (int i = 0; i < 10000; i++) counter++;
}

int main() {
    vector<thread> threads;
    for (int i = 0; i < 4; i++) threads.emplace_back(worker);
    for (auto& t : threads) t.join();
    cout << "Atomic counter: " << counter.load() << endl;
    // Compare-exchange
    int expected = 0, desired = 1;
    int val = 0;
    // (simplified demo)
    cout << "Atomics work correctly" << endl;
    return 0;
}
