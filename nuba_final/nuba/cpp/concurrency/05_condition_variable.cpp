// Concurrency: Condition Variable
#include <iostream>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <queue>
using namespace std;

mutex mtx;
condition_variable cv;
queue<int> data_queue;
bool done = false;

void producer() {
    for (int i = 0; i < 10; i++) {
        {
            lock_guard<mutex> lock(mtx);
            data_queue.push(i);
            cout << "Produced: " << i << endl;
        }
        cv.notify_one();
        this_thread::sleep_for(chrono::milliseconds(20));
    }
    {
        lock_guard<mutex> lock(mtx);
        done = true;
    }
    cv.notify_all();
}

void consumer() {
    while (true) {
        unique_lock<mutex> lock(mtx);
        cv.wait(lock, [] { return !data_queue.empty() || done; });
        while (!data_queue.empty()) {
            cout << "Consumed: " << data_queue.front() << endl;
            data_queue.pop();
        }
        if (done) break;
    }
}

int main() {
    thread prod(producer);
    thread cons(consumer);
    prod.join(); cons.join();
    cout << "Producer-consumer done" << endl;
    return 0;
}
