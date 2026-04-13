// Concurrency: Parallel Algorithms
#include <iostream>
#include <thread>
#include <mutex>
#include <vector>
#include <atomic>
#include <functional>
using namespace std;

// Parallel Algorithms Implementation
class ParallelAlgorithms {
    mutex mtx;
    atomic<int> count{0};
public:
    void execute(function<void()> task) {
        lock_guard<mutex> lock(mtx);
        task();
        count++;
    }
    int get_count() const { return count.load(); }
};

int main() {
    cout << "=== Parallel Algorithms ===" << endl;
    ParallelAlgorithms impl;
    vector<thread> threads;
    for (int i = 0; i < 5; i++) {
        threads.emplace_back([&impl, i]() {
            impl.execute([i]() {
                cout << "Task " << i << " executed" << endl;
            });
        });
    }
    for (auto& t : threads) t.join();
    cout << "Total tasks: " << impl.get_count() << endl;
    return 0;
}
