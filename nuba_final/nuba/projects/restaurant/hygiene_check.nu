# Restaurant: Hygiene Check

class HygieneCheck {
    fun init(self, name) {
        self.name = name
        self.data = []
    }
    fun add(self, item) { push(self.data, item); return self }
    fun report(self) {
        print("=== Hygiene Check Report ===")
        for item in self.data { print(" -", item) }
    }
}

let mgr = new HygieneCheck("Hygiene Check Manager")
mgr.add("Item 1").add("Item 2").add("Item 3")
mgr.report()
