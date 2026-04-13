# Project: Student Grade Book
class Student {
    fun init(self, name, id) {
        self.name   = name
        self.id     = id
        self.grades = {}
    }
    fun add_grade(self, subject, score) {
        self.grades[subject] = score
        return self
    }
    fun average(self) {
        if len(self.grades) == 0 { return 0 }
        let total = 0
        for pair in items(self.grades) { total += pair[1] }
        return round(total / len(self.grades), 2)
    }
    fun letter_grade(self) {
        let avg = self.average()
        if avg >= 90 { return "A" }
        elif avg >= 80 { return "B" }
        elif avg >= 70 { return "C" }
        elif avg >= 60 { return "D" }
        else { return "F" }
    }
    fun report(self) {
        print(format("Student: {0} (ID: {1})", self.name, self.id))
        for pair in items(self.grades) {
            print(format("  {0}: {1}", pair[0], pair[1]))
        }
        print(format("  Average: {0} | Grade: {1}", self.average(), self.letter_grade()))
    }
}
class GradeBook {
    fun init(self, class_name) {
        self.class_name = class_name
        self.students   = []
    }
    fun add_student(self, student) {
        push(self.students, student)
        return self
    }
    fun class_average(self) {
        if len(self.students) == 0 { return 0 }
        let total = 0
        for s in self.students { total += s.average() }
        return round(total / len(self.students), 2)
    }
    fun top_student(self) {
        let top = self.students[0]
        for s in self.students {
            if s.average() > top.average() { top = s }
        }
        return top
    }
    fun report(self) {
        print("=== " + self.class_name + " Grade Book ===")
        for s in self.students { s.report(); print() }
        print("Class Average:", self.class_average())
        let top = self.top_student()
        print("Top Student:", top.name, "with average", top.average())
    }
}
let gb = new GradeBook("Computer Science 101")
let s1 = new Student("Alice", "S001")
s1.add_grade("Math", 95).add_grade("Physics", 88).add_grade("Programming", 92)
let s2 = new Student("Bob", "S002")
s2.add_grade("Math", 78).add_grade("Physics", 82).add_grade("Programming", 85)
let s3 = new Student("Carol", "S003")
s3.add_grade("Math", 91).add_grade("Physics", 94).add_grade("Programming", 98)
gb.add_student(s1).add_student(s2).add_student(s3)
gb.report()
