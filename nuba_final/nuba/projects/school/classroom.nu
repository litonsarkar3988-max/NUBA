# School: Classroom Management
class Classroom {
    fun init(self, room_no, capacity, floor) {
        self.room_no  = room_no
        self.capacity = capacity
        self.floor    = floor
        self.students = []
        self.teacher  = null
        self.subject  = null
        self.schedule = []
    }
    fun assign_teacher(self, teacher_name, subject) {
        self.teacher = teacher_name
        self.subject = subject
        return self
    }
    fun add_student(self, student_name) {
        if len(self.students) >= self.capacity {
            throw "Classroom " + self.room_no + " is full!"
        }
        push(self.students, student_name)
        return self
    }
    fun is_full(self) { return len(self.students) >= self.capacity }
    fun occupancy_pct(self) {
        return round(len(self.students) * 100 / self.capacity, 1)
    }
    fun info(self) {
        print(format("Room {0} (Floor {1}) | Capacity: {2} | Occupied: {3} ({4}%)",
            self.room_no, self.floor, self.capacity,
            len(self.students), self.occupancy_pct()))
        if self.teacher != null {
            print("  Teacher:", self.teacher, "| Subject:", self.subject)
        }
    }
}
let room = new Classroom("101", 40, 1)
room.assign_teacher("Mr. Johnson", "Mathematics")
let students = ["Alice","Bob","Carol","Dave","Eve","Frank","Grace","Hank"]
for s in students { room.add_student(s) }
room.info()
print("Students:", room.students)
