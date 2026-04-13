# School: Complete School Management Demo
print("=== Nuba School Management System ===")
print()

# School class
class School {
    fun init(self, name, address) {
        self.name     = name
        self.address  = address
        self.students = []
        self.teachers = []
        self.classes  = []
    }
    fun enroll_student(self, id, name, grade) {
        push(self.students, {"id":id,"name":name,"grade":grade})
        print("Enrolled:", name, "("+id+")")
    }
    fun hire_teacher(self, id, name, subject) {
        push(self.teachers, {"id":id,"name":name,"subject":subject})
        print("Hired:", name, "-", subject)
    }
    fun stats(self) {
        print("=== School Stats ===")
        print("School:", self.name)
        print("Students:", len(self.students))
        print("Teachers:", len(self.teachers))
        let ratio = round(len(self.students) / max([1,len(self.teachers)]),1)
        print("Student:Teacher ratio:", str(ratio)+":1")
    }
}

let school = new School("Nuba Academy", "123 Learning Lane")
for i in 1..11 { school.enroll_student("S"+str(i), "Student"+str(i), "Grade "+str(floor(i/3)+9)) }
school.hire_teacher("T001","Mr. Johnson","Mathematics")
school.hire_teacher("T002","Ms. Davis","Physics")
school.hire_teacher("T003","Mrs. Smith","English")
school.hire_teacher("T004","Mr. Brown","History")
school.stats()
