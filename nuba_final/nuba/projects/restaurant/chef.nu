# Restaurant: Chef

class Chef {
    fun init(self, name) {
        self.name = name
        self.data = []
    }
    fun add(self, item) { push(self.data, item); return self }
    fun report(self) {
        print("=== Chef Report ===")
        for item in self.data { print(" -", item) }
    }
}

let mgr = new Chef("Chef Manager")
mgr.add("Item 1").add("Item 2").add("Item 3")
mgr.report()
