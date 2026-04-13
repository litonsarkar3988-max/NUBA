// Concurrency: Future and Promise
#include <iostream>
#include <thread>
#include <future>
#include <chrono>
using namespace std;

int heavy_computation(int n) {
    this_thread::sleep_for(chrono::milliseconds(100));
    int result = 0;
    for (int i = 1; i <= n; i++) result += i;
    return result;
}

string fetch_data(const string& url) {
    this_thread::sleep_for(chrono::milliseconds(50));
    return "Data from: " + url;
}

int main() {
    // async
    auto f1 = async(launch::async, heavy_computation, 100);
    auto f2 = async(launch::async, fetch_data, "http://example.com");

    cout << "Working on other tasks..." << endl;

    cout << "Sum: " << f1.get() << endl;
    cout << f2.get() << endl;

    // promise/future
    promise<int> prom;
    future<int> fut = prom.get_future();
    thread t([&prom]() {
        this_thread::sleep_for(chrono::milliseconds(30));
        prom.set_value(42);
    });
    cout << "Promise value: " << fut.get() << endl;
    t.join();
    return 0;
}
