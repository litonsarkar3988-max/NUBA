# School: Teacher Management
class Teacher {
    fun init(self, id, name, subject, qualification) {
        self.id            = id
        self.name          = name
        self.subject       = subject
        self.qualification = qualification
        self.classes       = []
        self.schedule      = {}
    }
    fun assign_class(self, class_name, students_count) {
        push(self.classes, {"class":class_name,"count":students_count})
        return self
    }
    fun set_schedule(self, day, periods) {
        self.schedule[day] = periods
        return self
    }
    fun total_students(self) {
        return sum(map(fun(c)->c["count"], self.classes))
    }
    fun weekly_hours(self) {
        let total = 0
        for pair in items(self.schedule) { total += len(pair[1]) }
        return total
    }
    fun profile(self) {
        print("=== Teacher Profile ===")
        print("Name:", self.name)
        print("Subject:", self.subject)
        print("Qualification:", self.qualification)
        print("Classes:", len(self.classes), "| Students:", self.total_students())
        print("Weekly Hours:", self.weekly_hours())
    }
}
let t = new Teacher("T001","Mr. Johnson","Mathematics","M.Sc Mathematics, B.Ed")
t.assign_class("10-A",35).assign_class("10-B",32).assign_class("11-A",30)
t.set_schedule("Monday",["Period1","Period2","Period4"])
t.set_schedule("Tuesday",["Period3","Period5"])
t.set_schedule("Wednesday",["Period1","Period3","Period5"])
t.profile()
