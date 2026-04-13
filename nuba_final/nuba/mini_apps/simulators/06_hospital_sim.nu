# Mini App: Hospital Sim
# Category: Simulators

print("=== Hospital Sim ===")

class HospitalsimApp {
    fun init(self) {
        self.name    = "Hospital Sim"
        self.version = "1.0.0"
        self.history = []
        self.config  = {"output":"console","verbose":false}
    }

    fun run(self, input_data) {
        print("Running Hospital Sim...")
        let result = self.process(input_data)
        push(self.history, {"input":str(input_data),"output":str(result)})
        return result
    }

    fun process(self, data) {
        # Core Hospital Sim logic
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

let app = new HospitalsimApp()

# Test with various inputs
print(app.run("Hello, Nuba World!"))
print(app.run([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))
print(app.run({"name":"Nuba","version":1,"active":true}))
app.report()
