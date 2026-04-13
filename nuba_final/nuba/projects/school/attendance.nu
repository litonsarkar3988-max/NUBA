# School: Attendance System
class AttendanceRecord {
    fun init(self, class_name) {
        self.class_name = class_name
        self.records    = {}
    }
    fun mark(self, date, student_id, present) {
        if not has(self.records, date) { self.records[date] = {} }
        self.records[date][student_id] = present
        return self
    }
    fun mark_all(self, date, student_ids, present_ids) {
        for sid in student_ids {
            self.mark(date, sid, present_ids.contains(sid))
        }
        return self
    }
    fun student_pct(self, student_id) {
        let total = 0; let present = 0
        for pair in items(self.records) {
            if has(pair[1], student_id) {
                total += 1
                if pair[1][student_id] { present += 1 }
            }
        }
        if total == 0 { return 0 }
        return round(present * 100 / total, 1)
    }
    fun daily_report(self, date) {
        if not has(self.records, date) { print("No records for", date); return }
        let day = self.records[date]
        let present = len(filter(fun(v)->v, values(day)))
        let total   = len(day)
        print(format("Attendance {0} ({1}): {2}/{3} present ({4}%)",
            date, self.class_name, present, total,
            round(present*100/total,1)))
        print("Absent:", [k for k in keys(day) if not day[k]])
    }
    fun low_attendance(self, student_ids, threshold) {
        return filter(fun(s)->self.student_pct(s)<threshold, student_ids)
    }
}
let att = new AttendanceRecord("10-A")
let all_students = ["S001","S002","S003","S004","S005"]
att.mark_all("2024-01-01", all_students, ["S001","S002","S003","S004"])
att.mark_all("2024-01-02", all_students, ["S001","S003","S005"])
att.mark_all("2024-01-03", all_students, ["S001","S002","S003","S004","S005"])
att.daily_report("2024-01-01")
att.daily_report("2024-01-02")
print("Low attendance (<80%):", att.low_attendance(all_students, 80))
