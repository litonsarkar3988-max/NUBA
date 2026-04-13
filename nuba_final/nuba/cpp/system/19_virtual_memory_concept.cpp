// System Programming (C++): 19 Virtual Memory Concept
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <memory>
#include <chrono>
#include <stdexcept>
using namespace std;

// 19 Virtual Memory Concept

class SystemUtils {
public:
    // Timing utility
    static auto now() { return chrono::high_resolution_clock::now(); }
    static double elapsed_ms(chrono::high_resolution_clock::time_point start) {
        auto end = now();
        return chrono::duration<double, milli>(end - start).count();
    }

    // Safe file read
    static string read_file(const string& path) {
        ifstream f(path);
        if (!f.is_open()) throw runtime_error("Cannot open: " + path);
        return string(istreambuf_iterator<char>(f), {});
    }

    // Safe file write
    static void write_file(const string& path, const string& content) {
        ofstream f(path);
        if (!f.is_open()) throw runtime_error("Cannot write: " + path);
        f << content;
    }

    // Memory usage info
    static void memory_info() {
        cout << "sizeof(int) = " << sizeof(int) << endl;
        cout << "sizeof(long) = " << sizeof(long) << endl;
        cout << "sizeof(pointer) = " << sizeof(void*) << endl;
    }
};

// Custom memory pool
template<typename T, size_t PoolSize>
class MemoryPool {
    T pool[PoolSize];
    bool used[PoolSize];
    size_t pool_size = PoolSize;

public:
    MemoryPool() { fill(begin(used), end(used), false); }

    T* allocate() {
        for (size_t i = 0; i < pool_size; i++) {
            if (!used[i]) { used[i] = true; return &pool[i]; }
        }
        throw bad_alloc();
    }

    void deallocate(T* ptr) {
        size_t idx = ptr - pool;
        if (idx < pool_size) used[idx] = false;
    }

    size_t available() const {
        size_t cnt = 0;
        for (bool u : used) if (!u) cnt++;
        return cnt;
    }
};

int main() {
    cout << "=== 19 Virtual Memory Concept ===" << endl;

    // Timing demo
    auto start = SystemUtils::now();
    volatile long sum = 0;
    for (int i = 0; i < 1000000; i++) sum += i;
    cout << "Sum computation: " << SystemUtils::elapsed_ms(start) << "ms" << endl;

    // Memory info
    SystemUtils::memory_info();

    // Memory pool demo
    MemoryPool<int, 10> pool;
    cout << "Pool available: " << pool.available() << endl;
    int* p1 = pool.allocate();
    int* p2 = pool.allocate();
    *p1 = 42; *p2 = 100;
    cout << "Allocated: " << *p1 << ", " << *p2 << endl;
    cout << "Pool available: " << pool.available() << endl;
    pool.deallocate(p1);
    cout << "After free: " << pool.available() << endl;

    return 0;
}
