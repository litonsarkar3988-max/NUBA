// C++ Project: Student Database
// Project: Student Database (C++)
#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <algorithm>
#include <iomanip>
using namespace std;

struct Student {
    int id;
    string name;
    map<string, double> grades;

    double average() const {
        if (grades.empty()) return 0;
        double sum = 0;
        for (const auto& [sub, g] : grades) sum += g;
        return sum / grades.size();
    }

    char letter_grade() const {
        double avg = average();
        if (avg >= 90) return 'A';
        if (avg >= 80) return 'B';
        if (avg >= 70) return 'C';
        if (avg >= 60) return 'D';
        return 'F';
    }

    void print() const {
        cout << fixed << setprecision(2);
        cout << "[" << id << "] " << name
             << " | Avg: " << average()
             << " | Grade: " << letter_grade() << endl;
        for (const auto& [sub, g] : grades)
            cout << "  " << sub << ": " << g << endl;
    }
};

class StudentDB {
    vector<Student> students;
    int next_id = 1001;

public:
    Student& add(const string& name) {
        students.push_back({next_id++, name, {}});
        return students.back();
    }

    void add_grade(int id, const string& subject, double grade) {
        for (auto& s : students)
            if (s.id == id) { s.grades[subject] = grade; return; }
        throw runtime_error("Student not found: " + to_string(id));
    }

    Student* find(int id) {
        for (auto& s : students)
            if (s.id == id) return &s;
        return nullptr;
    }

    vector<Student*> search(const string& name) {
        vector<Student*> result;
        for (auto& s : students)
            if (s.name.find(name) != string::npos)
                result.push_back(&s);
        return result;
    }

    Student* top_student() {
        if (students.empty()) return nullptr;
        return &*max_element(students.begin(), students.end(),
            [](const Student& a, const Student& b) {
                return a.average() < b.average();
            });
    }

    double class_average() const {
        if (students.empty()) return 0;
        double sum = 0;
        for (const auto& s : students) sum += s.average();
        return sum / students.size();
    }

    void print_all() const {
        cout << "=== Student Database ===" << endl;
        for (const auto& s : students) s.print();
        cout << fixed << setprecision(2);
        cout << "Class average: " << class_average() << endl;
    }
};

int main() {
    StudentDB db;
    auto& alice = db.add("Alice Smith");
    auto& bob   = db.add("Bob Jones");
    auto& carol = db.add("Carol White");

    db.add_grade(alice.id, "Math", 95);
    db.add_grade(alice.id, "Physics", 88);
    db.add_grade(alice.id, "CS", 92);

    db.add_grade(bob.id, "Math", 78);
    db.add_grade(bob.id, "Physics", 82);
    db.add_grade(bob.id, "CS", 85);

    db.add_grade(carol.id, "Math", 91);
    db.add_grade(carol.id, "Physics", 94);
    db.add_grade(carol.id, "CS", 98);

    db.print_all();
    cout << endl;

    auto* top = db.top_student();
    if (top) {
        cout << "Top student: " << top->name
             << " (" << top->average() << ")" << endl;
    }
    return 0;
}
