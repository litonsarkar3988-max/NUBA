# Restaurant: Supplier

class Supplier {
    fun init(self, name) {
        self.name = name
        self.data = []
    }
    fun add(self, item) { push(self.data, item); return self }
    fun report(self) {
        print("=== Supplier Report ===")
        for item in self.data { print(" -", item) }
    }
}

let mgr = new Supplier("Supplier Manager")
mgr.add("Item 1").add("Item 2").add("Item 3")
mgr.report()
