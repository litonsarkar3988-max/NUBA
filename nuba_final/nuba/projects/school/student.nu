# School: Student Management
class Student {
    fun init(self, id, name, grade, dob) {
        self.id       = id
        self.name     = name
        self.grade    = grade
        self.dob      = dob
        self.courses  = []
        self.grades   = {}
        self.attendance = {}
    }
    fun enroll(self, course) {
        if not self.courses.contains(course) { push(self.courses, course) }
        return self
    }
    fun add_grade(self, course, score) {
        self.grades[course] = score
        return self
    }
    fun mark_attendance(self, date, present) {
        self.attendance[date] = present
        return self
    }
    fun gpa(self) {
        if len(self.grades) == 0 { return 0.0 }
        let total = sum(values(self.grades))
        return round(total / len(self.grades) / 25, 2)
    }
    fun attendance_pct(self) {
        if len(self.attendance) == 0 { return 0 }
        let present = len(filter(fun(v)->v, values(self.attendance)))
        return round(present * 100 / len(self.attendance), 1)
    }
    fun report_card(self) {
        print("=== Report Card ===")
        print("Student:", self.name, "("+self.id+")")
        print("Grade:", self.grade)
        print("GPA:", self.gpa(), "/ 4.0")
        print("Attendance:", self.attendance_pct(), "%")
        print("Courses:")
        for course in self.courses {
            let score = self.grades[course] if has(self.grades, course) else "N/A"
            print(format("  {0}: {1}", course, score))
        }
    }
}
let s = new Student("S001","Alice Smith","10th","2008-03-15")
s.enroll("Math").enroll("Physics").enroll("English").enroll("History")
s.add_grade("Math",95).add_grade("Physics",88).add_grade("English",92).add_grade("History",85)
s.mark_attendance("2024-01-01",true).mark_attendance("2024-01-02",true).mark_attendance("2024-01-03",false)
s.report_card()
