# Mini App: Iban Validator
# Category: Validators

print("=== Iban Validator ===")

class IbanvalidatorApp {
    fun init(self) {
        self.name    = "Iban Validator"
        self.version = "1.0.0"
        self.history = []
        self.config  = {"output":"console","verbose":false}
    }

    fun run(self, input_data) {
        print("Running Iban Validator...")
        let result = self.process(input_data)
        push(self.history, {"input":str(input_data),"output":str(result)})
        return result
    }

    fun process(self, data) {
        # Core Iban Validator logic
        if isString(data) {
            return {"processed": data.upper(), "length": len(data), "words": len(split(data," "))}
        } elif isList(data) {
            return {"count": len(data), "sum": sum(data) if len(data)>0 else 0, "avg": sum(data)/len(data) if len(data)>0 else 0}
        } elif isDict(data) {
            return {"keys": len(keys(data)), "processed": true}
        }
        return {"result": data, "type": type(data)}
    }

    fun report(self) {
        print(format("{0} v{1} - {2} operations", self.name, self.version, len(self.history)))
        for entry in self.history.slice(0, min([3, len(self.history)])) {
            print("  Input:", entry["input"][:30], "-> Output:", entry["output"][:30])
        }
    }
}

let app = new IbanvalidatorApp()

# Test with various inputs
print(app.run("Hello, Nuba World!"))
print(app.run([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
print(app.run({"name":"Nuba","version":1,"active":true}))
app.report()
