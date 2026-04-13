# Restaurant: Table Management
class Table {
    fun init(self, table_no, capacity, location) {
        self.no       = table_no
        self.capacity = capacity
        self.location = location
        self.status   = "FREE"
        self.guests   = 0
        self.waiter   = null
    }
    fun seat(self, guests, waiter) {
        if self.status != "FREE" { throw "Table "+str(self.no)+" is not available" }
        if guests > self.capacity { throw "Table "+str(self.no)+" too small (max "+str(self.capacity)+")" }
        self.guests = guests
        self.waiter = waiter
        self.status = "OCCUPIED"
        print(format("Table {0} seated {1} guests | Waiter: {2}", self.no, guests, waiter))
    }
    fun free(self) {
        self.guests = 0; self.waiter = null; self.status = "FREE"
        print("Table", self.no, "is now free")
    }
    fun reserve(self, name, time) {
        self.status = "RESERVED"
        print(format("Table {0} reserved for {1} at {2}", self.no, name, time))
    }
    def display(self) {
        print(format("  T{0:02d} | Cap:{1} | {2:10} | {3} | Waiter:{4}",
            self.no, self.capacity, self.location, self.status,
            self.waiter if self.waiter else "-"))
    }
}
class TableManager {
    fun init(self) { self.tables = [] }
    fun add_table(self, table) { push(self.tables, table) }
    fun available(self, min_capacity) {
        return filter(fun(t)->t.status=="FREE" and t.capacity>=min_capacity, self.tables)
    }
    fun find_table(self, no) {
        for t in self.tables { if t.no == no { return t } }
        return null
    }
    fun occupancy(self) {
        let occ = len(filter(fun(t)->t.status=="OCCUPIED", self.tables))
        return round(occ * 100 / len(self.tables), 1)
    }
    fun floor_plan(self) {
        print("=== Restaurant Floor Plan ===")
        for t in self.tables { t.display() }
        print("Occupancy:", str(self.occupancy()) + "%")
    }
}
let mgr = new TableManager()
for i in 1..9 {
    let loc = "Window" if i <= 3 else ("Center" if i <= 6 else "Back")
    mgr.add_table(new Table(i, 2 if i%2==0 else 4, loc))
}
mgr.find_table(1).seat(2, "Carlos")
mgr.find_table(3).seat(4, "Maria")
mgr.find_table(5).reserve("Smith Family", "19:30")
mgr.floor_plan()
