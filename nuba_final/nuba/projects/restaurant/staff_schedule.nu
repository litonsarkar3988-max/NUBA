# Restaurant: Staff Schedule

class StaffSchedule {
    fun init(self, name) {
        self.name = name
        self.data = []
    }
    fun add(self, item) { push(self.data, item); return self }
    fun report(self) {
        print("=== Staff Schedule Report ===")
        for item in self.data { print(" -", item) }
    }
}

let mgr = new StaffSchedule("Staff Schedule Manager")
mgr.add("Item 1").add("Item 2").add("Item 3")
mgr.report()
