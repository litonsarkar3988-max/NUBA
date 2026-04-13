# School: Timetable Generator
class Period {
    fun init(self, time, subject, teacher, room) {
        self.time    = time
        self.subject = subject
        self.teacher = teacher
        self.room    = room
    }
    fun display(self) {
        print(format("  {0} | {1:15} | {2:15} | Room {3}",
            self.time, self.subject, self.teacher, self.room))
    }
}
class Timetable {
    fun init(self, class_name) {
        self.class_name = class_name
        self.schedule   = {}
        let days = ["Monday","Tuesday","Wednesday","Thursday","Friday"]
        for day in days { self.schedule[day] = [] }
    }
    fun add_period(self, day, time, subject, teacher, room) {
        push(self.schedule[day], new Period(time, subject, teacher, room))
        return self
    }
    fun display(self) {
        print("=== Timetable:", self.class_name, "===")
        for pair in items(self.schedule) {
            if len(pair[1]) > 0 {
                print(pair[0] + ":")
                for period in pair[1] { period.display() }
            }
        }
    }
}
let tt = new Timetable("Class 10-A")
tt.add_period("Monday","08:00-09:00","Mathematics","Mr. Johnson","101")
tt.add_period("Monday","09:00-10:00","Physics","Ms. Davis","Lab1")
tt.add_period("Monday","10:30-11:30","English","Mrs. Smith","102")
tt.add_period("Tuesday","08:00-09:00","History","Mr. Brown","103")
tt.add_period("Tuesday","09:00-10:00","Mathematics","Mr. Johnson","101")
tt.add_period("Wednesday","08:00-09:00","Chemistry","Ms. Wilson","Lab2")
tt.display()
