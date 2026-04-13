# Mini Project: Calendar Printer
# Build a Calendar Printer using Nuba

print("=== Calendar Printer ===")

class Calendarprinter {
    fun init(self) {
        self.data   = []
        self.config = {}
        print("Initialized: Calendar Printer")
    }

    fun process(self, input) {
        let result = str(input)
        push(self.data, result)
        return result
    }

    fun output(self) {
        print("Results:")
        for item in self.data { print("  -", item) }
        return self.data
    }
}

let app = new Calendarprinter()
for item in ["test1", "test2", "test3", "test4", "test5"] {
    app.process(item)
}
app.output()
